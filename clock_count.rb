#!/usr/bin/env ruby
require_relative 'lib/bell_counter'
require_relative 'lib/time_parser'
require 'pry'

USAGE = "

Usage: clock_count.rb <start_time> <end_time>

This program determines the number of chimes that can be hear
between a start_time and an end_time.

Times should be provided in valid 24 hr notation:
E.g. 00:00 is 12am, 15:00 is 3pm, and 23:59 is 11:59pm, etc.

"

if __FILE__ == $PROGRAM_NAME
  abort(USAGE) if ARGV.length != 2

  start_time = TimeParser.parse_time ARGV[0]
  end_time = TimeParser.parse_time ARGV[1]

  bell_counter = BellCounter.new(start_time, end_time)
  puts bell_counter.count_bells
end
