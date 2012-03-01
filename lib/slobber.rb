require 'rubygems'
require 'bundler/setup'

require 'appscript'

module Slobber
  class Terminal
    Appscript::app('Terminal').launch

    def initialize window=nil, tab=nil
      if window.nil?
        window, tab = self.class.new_tab_new_window
      else
        if window.is_a? Fixnum
          window = self.class.appscript.windows[window].get
        end
        if tab.nil?
          tab = self.class.new_tab_in window
        elsif tab.is_a? Fixnum
            tab = window.tabs[tab].get
        end
      end
      
      @window = window
      @tab = tab
    end

    def to_front
      @window.frontmost.set(1)
      @window.selected_tab.set(@tab)
    end

    def method_missing(meth, *args, &block)
      if @tab.respond_to?(meth)
        @tab.send(meth, *args, &block)
      else
        super
      end
    end

    def new_tab_this_window
      self.class.new_tab_in @window
    end

    def self.current_window
      appscript.windows[Appscript.its.frontmost.eq(true)].get.first
    end

    def self.current_tab
      w = current_window
      new(w, w.selected_tab.get)
    end
    
    def self.appscript
      Appscript::app('Terminal')
    end

    def self.keystroke key, args=Hash.new
      Appscript::app("System Events").application_processes["Terminal.app"].
        keystroke(key, args)
    end

    def self.method_missing(meth, *args, &block)
      if appscript.respond_to?(meth)
        appscript.send(meth, *args, &block)
      else
        super
      end
    end

    def self.new_tab_new_window
      keystroke("n", :using => :command_down)
      w = current_window
      t = w.selected_tab.get
      return w, t
    end

    def self.new_tab_in window
      window.frontmost.set(1)
      keystroke "t", :using => :command_down
    end
    
  end

  class Daemon
  end

  class Client
  end
end
