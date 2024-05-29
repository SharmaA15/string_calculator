require 'rails_helper'

RSpec.describe 'StringCalculator' do
  # Test that an empty string returns 0
  it 'returns 0 for an empty string' do
    result = StringCalculator.add("")
    puts "Result for empty string: #{result}" # Print the result
    expect(result).to eq(0)
  end

  # Test that a single number returns the number itself
  it 'returns the number itself for a single number' do
    result = StringCalculator.add("1")
    puts "Result for single number '1': #{result}" # Print the result
    expect(result).to eq(1)
  end

  # Test that two numbers separated by a comma are summed correctly
  it 'returns the sum of two numbers' do
    result = StringCalculator.add("1,5")
    puts "Result for '1,5': #{result}" # Print the result
    expect(result).to eq(6)
  end

  # Test that an unknown amount of numbers are summed correctly
  it 'handles an unknown amount of numbers' do
    result = StringCalculator.add("1,2,3,4,5")
    puts "Result for '1,2,3,4,5': #{result}" # Print the result
    expect(result).to eq(15)
  end

  # Test that new lines between numbers are handled and summed correctly
  it 'handles new lines between numbers' do
    result = StringCalculator.add("1\n2,3")
    puts "Result for '1\\n2,3': #{result}" # Print the result
    expect(result).to eq(6)
  end

  # Test that different delimiters can be used and the numbers are summed correctly
  it 'supports different delimiters' do
    result = StringCalculator.add("//;\n1;2")
    puts "Result for '//;\\n1;2': #{result}" # Print the result
    expect(result).to eq(3)
  end

  # Test that the method raises an exception for negative numbers
  it 'throws an exception for negative numbers' do
    begin
      StringCalculator.add("1,-2,3")
    rescue => e
      puts "Exception for '1,-2,3': #{e.message}" # Print the exception message
      expect(e.message).to eq("negative numbers not allowed: -2")
    end
  end

  # Test that the method raises an exception with all negative numbers listed
  it 'throws an exception with all negative numbers listed' do
    begin
      StringCalculator.add("1,-2,3,-4")
    rescue => e
      puts "Exception for '1,-2,3,-4': #{e.message}" # Print the exception message
      expect(e.message).to eq("negative numbers not allowed: -2, -4")
    end
  end
end
