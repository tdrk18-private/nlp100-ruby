# frozen_string_literal: true

# String extension methods
class String
  # @return [Boolean]
  def lower?
    cmp = (self =~ /^[a-z]+$/)
    return false if cmp.nil?

    cmp.zero?
  end
end
