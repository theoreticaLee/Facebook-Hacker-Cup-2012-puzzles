#!/usr/bin/env ruby

class AlphabetSoup
  REQUIRED_LETTERS = "HACKERUP"
  
  def initialize(content)
    bits = content.split("\n")
    @testCount = bits.shift # not used
    @tests     = bits
  end
  
  def decode()
    @tests.each_with_index do |test, testNumber|
      # build usage count
      letters = Hash[REQUIRED_LETTERS.chars.map {|letter| [letter, 0]}]
      # enumerate
      test.chars do |char|
        next unless letters.has_key?(char)
        letters[char] += 1
      end
      # reduce c usage by 50% since it's used 2x
      letters["C"] = letters["C"] / 2
      # find min count of needed letter
      puts "Case #{testNumber + 1}: #{letters.values.sort.first}"
    end
  end
end

AlphabetSoup.new(STDIN.read).decode()

