#! /usr/bin/env ruby

# require 'optparse'

require 'lib/slobber'

# the original terminal window
t0 = Slobber::Terminal.current_tab

# open a new tab/window
t = Slobber::Terminal.new

# bring the original tab/window to the front
t0.to_front

# open a new tab in the original window
t0.new_tab_this_window

sleep(1)

# bring the created window/tab to the front
t.to_front

sleep(1)

# bring the original window/tab to the front
t0.to_front
