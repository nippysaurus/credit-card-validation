#!/usr/bin/env ruby

require_relative 'classes/credit_card_number'

ARGF.each do |line|

  credit_card_number = CreditCardNumber.new(line)

  puts credit_card_number.to_s

end