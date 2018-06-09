require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'minitest/pride'
require './lib/credit_check'

class CreditCheckTest < Minitest::Test
  def setup
    @cc = CreditCheck.new
  end

  def test_it_exists
    assert_instance_of CreditCheck, @cc
  end

  def test_it_can_double_every_other_digit_from_the_right
    assert_equal [1, 4, 3, 8, 5], @cc.double(12345)
  end

  def test_it_can_add_together_double_digits
    array = [1, 12, 4, 15, 17]
    assert_equal [1, 3, 4, 6, 8], @cc.add_double_digits(array)
  end

  def test_it_can_sum_digits
    array = [1, 2, 3, 4, 5]
    assert_equal 15, @cc.sum_digits(array)
  end

  def test_it_can_check_for_validity
    assert @cc.check_validity(70)
    refute @cc.check_validity(75)
  end

  def test_if_the_number_is_valid
    cc = CreditCheck.new
    assert cc.valid_number?(5541808923795240)
    cc = CreditCheck.new
    refute cc.valid_number?(5541801923795240)
  end

  def test_the_output
    cc = CreditCheck.new
    assert cc.validation_output(5541808923795240)
    refute cc.validation_output(5541801923795240)
  end
end
