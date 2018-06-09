class CreditCheck
  def initialize; end

  def double(number)
    number = number.to_s.chars.reverse
    new_number = []
    number.each_with_index do |digit, index|
      digit = digit.to_i
      digit *= 2 if index.odd?
      new_number << digit
    end
    new_number.reverse
  end

  def add_double_digits(array)
    array.map do |digit|
      if digit.to_s.chars.length == 2
        digit = digit.to_s.chars
        digit = digit.map(&:to_i).sum
      end
      digit
    end
  end

  def sum_digits(array)
    array.sum
  end

  def check_validity(number)
    (number % 10).zero?
  end

  def valid_number?(number)
    check_validity(sum_digits(add_double_digits(double(number))))
  end

  def validation_output(number)
    if valid_number?(number)
      puts "The number #{number} is valid."
      true
    else
      puts "The number #{number} is invalid."
      false
    end
  end
end

# print 'Enter the credit card number: '
# input = gets.chomp
# cc = CreditCheck.new
# cc.validation_output(input)
