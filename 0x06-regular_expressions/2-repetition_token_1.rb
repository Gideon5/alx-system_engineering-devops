#!/usr/bin/env ruby 

#This code matches a string with this format "hbtn" or "htn"

puts ARGV[0].scan(/hb{0,1}tn/).join
