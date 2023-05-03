#!/usr/bin/env ruby 

#This code matches a string with this format "hbtn"

puts ARGV[0].scan(/hb(t*)n/).join
