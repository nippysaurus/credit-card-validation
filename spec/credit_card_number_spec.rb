require_relative '../classes/credit_card_number'
require 'rspec'


describe CreditCardNumber do

  #
  # DATA
  #

  known_card_type_data = {
      visa: [ '4111111111111111', '4111111111111', '4012888888881881' ],
      amex: [ '378282246310005' ],
      discover: [ '6011111111111117' ],
      mastercard: [ '5105105105105100', '5105105105105106' ]
  }

  unknown_card_type_data = [ '9111111111111111' ]

  known_valid_card_numbers = [ '4111111111111111', '4012888888881881', '378282246310005', '6011111111111117', '5105105105105100' ]
  known_invalid_card_numbers = [ '4111111111111', '5105105105105106', '9111111111111111' ]

  #
  # CHECKS
  #

  it 'should detect valid card type' do
    known_card_type_data.each do |expected_card_type,samples|
      samples.each do |sample|
        credit_card_number = CreditCardNumber.new(sample)
        credit_card_number.card_type.downcase.should.eql?(expected_card_type.downcase)
      end
    end
  end

  it 'should detect invalid card type' do
    unknown_card_type_data.each do |sample|
      credit_card_number = CreditCardNumber.new(sample)
      credit_card_number.card_type.should.eql?('unknown'.downcase)
    end
  end

  it 'should detect valid card numbers' do
    known_valid_card_numbers.each do |sample|
      credit_card_number = CreditCardNumber.new(sample)
      credit_card_number.valid?.should == true
    end
  end

  it 'should detect invalid card numbers' do
    known_invalid_card_numbers.each do |sample|
      credit_card_number = CreditCardNumber.new(sample)
      credit_card_number.valid?.should == false
    end
  end

end