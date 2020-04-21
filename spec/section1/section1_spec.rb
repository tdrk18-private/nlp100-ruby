# frozen_string_literal: true

require 'spec_helper'
require_relative '../../section1/section1'

describe 'Section1' do
  it 'reverse string' do
    expect(Section1.reverse('stressed')).to eq 'desserts'
  end

  it 'extract odd strings from text' do
    expect(Section1.extract_odd_string('パタトクカシーー')).to eq 'パトカー'
  end

  it 'merge two string alternately' do
    expect(Section1.merge_strings('パトカー', 'タクシー')).to eq 'パタトクカシーー'
  end

  it 'create list of count of alphabets' do
    text = 'Now I need a drink, alcoholic of course, ' \
         + 'after the heavy lectures involving quantum mechanics.'
    ans = [3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5, 8, 9, 7, 9]
    expect(Section1.pi_list(text)).to eq ans
  end
end
