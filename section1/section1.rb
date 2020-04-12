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
end
