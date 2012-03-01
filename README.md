slobber
=======

Dan Swain, dan.t.swain@gmail.com, 3/1/2012

slobber is a slaver for OS X Terminal.app windows written in Ruby using the [rb-appscript](http://appscript.sourceforge.net/rb-appscript/index.html) Applescript bridge.

Goal
----

slobber is very much still a work in progress.  My ultimate goal is to be able to run it as a daemon that keeps track of project-specific windows, with a command-line client that can perform various commands.  Then, one could create keybindings to the command-line client and, e.g., run rspec tests from within your favorite text editor, with the tests being run in a terminal window.

My goal is not to reproduce something like the terminal emulator in emacs.  My goal is to create a natural interaction between my text editor (which happens to be emacs) and the terminal windows/tabs that I always have open anyways.

Status
------

* As of 3/1/2012: Able to create windows/tabs, raise them to the front.  See demo.rb