#!/usr/bin/env ruby 

#This code matches a string with this format "hbtn" or "htn"

puts ARGV[0].scan(/hbt{2,5}n/).join
