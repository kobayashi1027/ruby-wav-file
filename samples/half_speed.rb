#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
# half speed
require 'rubygems'
require 'wav-file'

if ARGV.size < 2
  puts 'ruby half_speed.rb input.rb output.wav'
  exit 1
end

f = open(ARGV.shift)
format, chunks = WavFile::readAll(f)
f.close

puts format.to_s
puts '===half speed==='
format.hz /= 2
format.bytePerSec /= 2
puts format.to_s


open(ARGV.shift, "w"){|out|
  WavFile::write(out, format, chunks)
}

