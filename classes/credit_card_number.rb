require_relative '../helpers/string'

class CreditCardNumber

  attr_accessor :number

  def initialize(number)
    @number = number.strip_whitespace
  end

  # Attempts to classify the card type.
  def card_type
    return 'AMEX' if is_amex_card?
    return 'Discover' if is_discover_card?
    return 'MasterCard' if is_mastercard_card?
    return 'VISA' if is_visa_card?
    'Unknown'
  end

  def is_amex_card?
    /^(34|37)\d{13}$/ =~ @number
  end

  def is_discover_card?
    /^6011\d{12}$/ =~ @number
  end

  def is_mastercard_card?
    /^(51|52|53|54|55)\d{14}$/ =~ @number
  end

  def is_visa_card?
    /^4(\d{12}|\d{15})$/ =~ @number
  end

  # Performs the standard Luhn Algorythm check.
  # http://en.wikipedia.org/wiki/Luhn_algorithm
  def luhn_algorythm_check

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

  alias :valid? :luhn_algorythm_check

  def to_s
    "#{card_type}: #{@number}".ljust(30) + "(#{ valid? ? 'valid' : 'invalid' })"
  end

end