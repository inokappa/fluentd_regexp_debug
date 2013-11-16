#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
 
require 'time'
require 'fluent/log'
require 'fluent/config'
require 'fluent/engine'
require 'fluent/parser'
 
$log ||= Fluent::Log.new
 
# debug
log = '2013-11-17 07:18:02,     25,       0.76,           0,       0.14,       32.89,        0.00,        4.54,      25,       0'
format = /^(?<date>(\d{4})-(\d{2})-(\d{2}) (\d{2}:)(\d{2}):(\d{2})),\s{1,}(?<Trans>\d+(\.\d+)?),\s{1,}(?<Elap_Time>\d+(\.\d+)?),\s{1,}(?<Data_Trans>\d+(\.\d+)?),\s{1,}(?<Resp_Time>\d+(\.\d+)?),\s{1,}(?<Trans_Rate>\d+(\.\d+)?),\s{1,}(?<Throughput>\d+(\.\d+)?),\s{1,}(?<Concurrent>\d+(\.\d+)?),\s{1,}(?<OKAY>\d+),\s{1,}(?<Failed>\d+)$/

time_format = ''
 
parser = Fluent::TextParser::RegexpParser.new(format, 'time_format' => time_format)
puts parser.call(log)
