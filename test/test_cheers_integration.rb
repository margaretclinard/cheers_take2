require_relative 'helper'

class TestCheersIntegration < Minitest::Test

  def test_zero_arguments_prints_help_message
    output = `./cheers`
    expected = <<EOS
I'd cheer for you, if only I knew who you were :(
Try again with `./cheers [Name] [MM/DD Birthday]`
EOS
    assert_equal expected, output
  end

  def test_one_valid_argument_name
    output = `./cheers Abby`
    expected = <<EOS
Give me an... A
Give me a... B
Give me a... B
Give me a... Y
Abby’s just GRAND!

I would wish you a Happy Birthday, if I knew when that was!
EOS
  assert_equal expected, output
  end

  def test_one_valid_argument_of_name_with_hyphens
    output = `./cheers Abby-Anne`
    expected = <<EOS
Give me an... A
Give me a... B
Give me a... B
Give me a... Y
Give me an... A
Give me an... N
Give me an... N
Give me an... E
Abby-Anne’s just GRAND!

I would wish you a Happy Birthday, if I knew when that was!
EOS
  assert_equal expected, output
  end

  def test_one_valid_argument_of_name_with_space
    output = `./cheers "Abby Anne"`
    expected = <<EOS
Give me an... A
Give me a... B
Give me a... B
Give me a... Y
Give me an... A
Give me an... N
Give me an... N
Give me an... E
Abby Anne’s just GRAND!

I would wish you a Happy Birthday, if I knew when that was!
EOS
  assert_equal expected, output
  end

  def test_date_argument_only
    output = `./cheers 08/25`
    expected = <<EOS
I'd cheer for you, if only I knew who you were :(
Try again with `./cheers [Name] [MM/DD Birthday]`
EOS
    assert_equal expected, output
  end

  def test_too_many_arguments
    output = `./cheers Abby Eliza 08/25`
    expected = <<EOS
I'd cheer for you, if only I knew who you were :(
Try again with `./cheers [Name] [MM/DD Birthday]`
EOS
    assert_equal expected, output
  end

  def test_only_non_word_characters_in_name
    output = `./cheers *~?`
    expected = <<EOS
I'd cheer for you, if only I knew who you were :(
Try again with `./cheers [Name] [MM/DD Birthday]`
EOS
  assert_equal expected, output
  end

  def test_two_valid_arguments
    skip
    output = `./cheers Abby 08/25`
    expected = <<EOS
Give me an... A
Give me a... B
Give me a... B
Give me a... Y
Abby’s just GRAND!

Awesome! Your birthday is in 127 days! Happy Birthday in advance!
EOS
  assert_equal expected, output
  end

  def test_one_valid_one_invalid_argument
    skip
    output = `./cheers Abby 08/25/15`
    expected = <<EOS
Try again with `./cheers [Name] [MM/DD Birthday]`
EOS
  assert_equal expected, output
  end

  def test_one_invalid_one_valid_argument
    output = `./cheers 1234 08/25`
    expected = <<EOS
I'd cheer for you, if only I knew who you were :(
Try again with `./cheers [Name] [MM/DD Birthday]`
EOS
  assert_equal expected, output
  end

  def test_empty_string_argument
    output = `./cheers ""`
    expected = <<EOS
I'd cheer for you, if only I knew who you were :(
Try again with `./cheers [Name] [MM/DD Birthday]`
EOS
  assert_equal expected, output
  end

  def test_whitespace_string_argument
    output = `./cheers " "`
    expected = <<EOS
I'd cheer for you, if only I knew who you were :(
Try again with `./cheers [Name] [MM/DD Birthday]`
EOS
  assert_equal expected, output
  end

  def test_valid_month_arguments
    skip
    output = `./cheers Abby 8/25`
    expected = <<EOS
Give me an... A
Give me a... B
Give me a... B
Give me a... Y
Abby’s just GRAND!

Awesome! Your birthday is in 127 days! Happy Birthday in advance!
EOS
  assert_equal expected, output
  end

  def test_invalid_month_arguments
    skip
    output = `./cheers Abby 25/08`
    expected = <<EOS
Give me an... A
Give me a... B
Give me a... B
Give me a... Y
Abby’s just GRAND!

I would wish you a Happy Birthday, if I knew when that was!
EOS
  assert_equal expected, output
  end
end
