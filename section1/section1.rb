# frozen_string_literal: true

# https://nlp100.github.io/ja/ch01.html
module Section1
  module_function

  # @param [String] str
  # @return [String]
  def reverse(str)
    str.reverse
  end

  # @param [String] text
  # @return [String]
  def extract_odd_string(text)
    text.split('').each_slice(2).map(&:first).join
  end

  # @param [String] l_str
  # @param [String] r_str
  # @return [String]
  def merge_strings(l_str, r_str)
    array = []
    first_array = l_str.split('')
    second_array = r_str.split('')
    [l_str.length, r_str.length].max.times do |index|
      array.append first_array[index] if first_array.length > index
      array.append second_array[index] if second_array.length > index
    end
    array.join
  end

  # @param [String] str
  # @return [[Int]]
  def pi_list(str)
    result = []
    str_list = str.split
    str_list.each do |s|
      result.append(s.gsub(/\W/, '').length)
    end
    result
  end

  # @param [String] str
  # @param [[Int]] one_length_list
  # @return [[String: Int]]
  def element_symbol(str, one_length_list)
    result = {}
    str_list = str.split
    str_list.each.with_index(1) do |s, idx|
      key = one_length_list.include?(idx) ? s.slice(0, 1) : s.slice(0, 2)
      result[:"#{key}"] = idx
    end
    result
  end
end
