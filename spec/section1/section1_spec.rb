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
end
