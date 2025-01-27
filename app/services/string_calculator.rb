class StringCalculator
    def self.add(numbers)
      return 0 if numbers.empty?
  
      delimiter = /,|\n/
      if numbers.start_with?('//')
        delimiter_section, numbers = numbers.split("\n", 2)
        if delimiter_section.start_with?('//[') && delimiter_section.end_with?(']')
          delimiter_str = delimiter_section[3...-1]
        else
          delimiter_str = delimiter_section[2..-1]
        end
        delimiter = Regexp.new(Regexp.escape(delimiter_str))
      end
  
      nums = numbers.split(delimiter).map(&:to_i)
      negatives = nums.select { |n| n < 0 }
  
      if negatives.any?
        raise "Negatives not allowed: #{negatives.join(', ')}"
      end
  
      nums.select { |n| n <= 1000 }.sum
    end
end