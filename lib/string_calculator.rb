class StringCalculator
  def self.add(str_nums)
    return 0 if str_nums.empty?
    return str_nums.to_i unless str_nums.include?(',')
    digits = str_nums.split(',').map(&:to_i)
    digits.sum
  end
end