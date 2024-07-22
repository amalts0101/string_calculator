class StringCalculator
  def self.add(str_nums)
    return 0 if str_nums.empty?
    raise_negative_nmbr_error(str_nums)
    digits(str_nums).sum
  end

  def self.raise_negative_nmbr_error(str_nums)
    negative_nums = digits(str_nums).select {|num| num < 0}
    raise "Negative numbers are not allowed: #{negative_nums.join(",")}" if negative_nums.any?
  end

  def self.digits(str_nums)
    delimiter = get_delimiter(str_nums)
    str_nums.gsub("\n", delimiter).split(delimiter).map(&:to_i)
  end

  def self.get_delimiter(str_nums)
    str_nums[0,2] == '//' ? str_nums[2,1] : ','
  end
end