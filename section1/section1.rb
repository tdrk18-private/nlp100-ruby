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

  # @param [Int] n
  # @param [String] string
  # @param [GramType] type
  # @return [[String]]
  def n_gram(n, string, type)
    case type
    when GramType::WORD
      word_n_gram(n, string)
    when GramType::CHARACTER
      character_n_gram(n, string)
    else
      ''
    end
  end

  # @param [Int] n
  # @param [String] string
  # @return [[String]]
  def word_n_gram(n, string)
    s = +string
    list = s.split
    result = []
    (list.length - n + 1).times do |idx|
      result.append(list[idx, n].join(' '))
    end
    result
  end

  # @param [Int] n
  # @param [String] string
  # @return [[String]]
  def character_n_gram(n, string)
    s = +string
    list = s.gsub(' ', '').split('')
    result = []
    (list.length - n + 1).times do |idx|
      result.append(list[idx, n].join)
    end
    result
  end

  # @param [String] x
  # @param [String] y
  # @return Set[String]
  def union(x, y)
    Set.new(x) + Set.new(y)
  end

  # @param [String] x
  # @param [String] y
  # @return Set[String]
  def intersection(x, y)
    Set.new(x) & Set.new(y)
  end

  # @param [String] x
  # @param [String] y
  # @return Set[String]
  def difference(x, y)
    Set.new(x) - Set.new(y)
  end

  # enum for n-gram type
  module GramType
    CHARACTER = 1
    WORD = 2
  end
end
