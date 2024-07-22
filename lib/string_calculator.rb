class StringCalculator
  def self.add(str_nums)
    return 0 if str_nums.empty?
    digits(str_nums).sum
  end

  def self.digits(str_nums)
    delimiter = ","
    str_nums.gsub("\n", delimiter).split(",").map(&:to_i)
  end
end