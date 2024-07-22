class StringCalculator
  def self.add(str_nums)
    return 0 if str_nums.empty?
    raise_negative_nmbr_error(str_nums)

    digits = digits(str_nums).reject {|num| num > 1000}
    digits.sum
  end

  def self.raise_negative_nmbr_error(str_nums)
    negative_nums = digits(str_nums).select {|num| num < 0}
    raise "Negative numbers are not allowed: #{negative_nums.join(",")}" if negative_nums.any?
  end

  def self.digits(str_nums)
    delimiter = get_delimiter(str_nums)
    str_nums.split(/#{delimiter}/).map(&:to_i)
  end

  def self.get_delimiter(str_nums)
    delimiter = /,|\n/
    if str_nums.start_with?('//')
      header, numbers = str_nums.split("\n", 2)
      if header.match?(/\/\/\[(.+)\]/)
        delimiter = Regexp.escape(header.match(/\/\/\[(.+)\]/)[1])
      else
        delimiter = Regexp.escape(header[2])
      end
    end
    delimiter
  end
end