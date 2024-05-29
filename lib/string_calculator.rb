class StringCalculator
	# This method adds numbers given in a string.
	# It supports comma or newline as default delimiters, and custom delimiters.
	def self.add(numbers)
		# Return 0 if the input string is empty
		return 0 if numbers.empty?

		# Default delimiter is a comma
		delimiter = ","
		
		# Check if the input starts with a custom delimiter declaration
		if numbers.start_with?("//")
			# Split the input into two parts: delimiter part and the rest of the numbers
			parts = numbers.split("\n", 2)
			# Extract the custom delimiter, escaping any special characters for regex
			delimiter = Regexp.escape(parts[0][2..-1])
			# The rest of the numbers string
			numbers = parts[1]
		end

		# Replace newline characters with the delimiter
		numbers.gsub!("\n", delimiter)
		# Split the numbers string by the delimiter and convert each part to an integer
		num_list = numbers.split(/#{delimiter}/).map(&:to_i)

		# Select negative numbers from the list
		negatives = num_list.select { |num| num < 0 }
		# If there are negative numbers, raise an exception listing them
		unless negatives.empty?
			raise "negative numbers not allowed: #{negatives.join(', ')}"
		end

		# Sum and return the numbers
		num_list.sum
	end
end
