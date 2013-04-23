require_relative '../helpers/string'

class CreditCardNumber

  attr_accessor :number

  def initialize(number)
    @number = number.strip_whitespace
  end

  def card_type
    return 'AMEX' if is_amex_card?
    return 'Discover' if is_discover_card?
    return 'MasterCard' if is_mastercard_card?
    return 'VISA' if is_visa_card?
    'Unknown'
  end

  def is_amex_card?
    return false if @number.length != 15
    prefix = @number[0..1]
    ( prefix == '34' || prefix == '37' )
  end

  def is_discover_card?
    return false if @number.length != 16
    prefix = @number[0..3]
    prefix == '6011'
  end

  def is_mastercard_card?
    return false if @number.length != 16
    prefix = @number[0..1]
    ( prefix == '51' || prefix == '52' || prefix == '53' || prefix == '54' || prefix == '55' )
  end

  def is_visa_card?
    return false if ( @number.length != 13 && @number.length != 16 )
    prefix = @number[0]
    prefix == '4'
  end

  def valid?

    number_copy = @number.clone
    number_copy.prepend('0') if number_copy.length.odd?
    number_copy.reverse!

    sum = 0

    number_copy.chars.each_slice(2) do |slice|

      sum += slice[0].to_i

      doubled = slice[1].to_i * 2
      doubled -= 9 if doubled > 9

      sum += doubled

    end

    sum % 10 == 0

  end

  def to_s
    "#{card_type}: #{@number}".ljust(30) + "(#{ valid? ? 'valid' : 'invalid' })"
  end

end