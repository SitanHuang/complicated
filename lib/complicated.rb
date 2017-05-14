# Load Bundler and load all your gems
require "bundler/setup"

# Explicitly load any gems you need.

require "complicated/version"
require "complicated/factory"
require 'complicated/battle'

module Complicated
  # Your code goes here...
  # Good place for your main application logic if this is a library.
  #
  # Create classes in the complicated folder and
  # be sure to create unit tests for them too.

  HOUSES = {}
  EMPIRES = {}

  def print_world
    EMPIRES.each do |key, val|
      puts "=================#{key}==================".underline.bold
      HOUSES.each do |key1, val1|
        next unless val1[:empire] == key
        print val1[:name]
        print ' (capital)'.bold if val1[:name] == val[:king]
        print " Infrastructure: #{val1[:inf]}".bold.light_cyan
        puts
      end
    end
  end

  def print_proc_house val
    puts "==House of #{val[:name]}==".underline.bold
    puts "Treasure: $#{val[:money]} million".light_red
    puts "Troops: #{val[:army]} million".light_green
    puts "Manpower: #{val[:pop]} million".light_yellow
    puts "Infrastructure: #{val[:inf]}".light_cyan
    puts
  end

end
