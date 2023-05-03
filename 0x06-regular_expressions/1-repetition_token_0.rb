#!/usr/bin/env ruby 

#This code matches a string with this format "hbtn"

puts ARGV[0].scan(/hb{0,1}(t*)n/).join
