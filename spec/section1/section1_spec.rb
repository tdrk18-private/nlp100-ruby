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

  it 'create list of element symbol' do
    text = 'Hi He Lied Because Boron Could Not Oxidize Fluorine. ' \
         + 'New Nations Might Also Sign Peace Security Clause. Arthur King Can.'
    one_length_list = [1, 5, 6, 7, 8, 9, 15, 16, 19]
    ans = { 'Be': 4, 'C': 6, 'B': 5, 'Ca': 20, 'F': 9, 'S': 16, 'H': 1,
            'K': 19, 'Al': 13, 'Mi': 12, 'Ne': 10, 'O': 8, 'Li': 3, 'P': 15,
            'Si': 14, 'Ar': 18, 'Na': 11, 'N': 7, 'Cl': 17, 'He': 2 }
    expect(Section1.element_symbol(text, one_length_list)).to eq ans
  end

  it 'return n-gram for strings' do
    text = 'I am an NLPer'
    ans_char = %w[Ia am ma an nN NL LP Pe er]
    ans_word = ['I am', 'am an', 'an NLPer']
    expect(Section1.n_gram(2, text, Section1::GramType::CHARACTER)).to eq ans_char
    expect(Section1.n_gram(2, text, Section1::GramType::WORD)).to eq ans_word
  end

  it 'calculate set of n-gram' do
    text_x = 'paraparaparadise'
    text_y = 'paragraph'
    bi_gram_x = Section1.n_gram(2, text_x, Section1::GramType::CHARACTER)
    bi_gram_y = Section1.n_gram(2, text_y, Section1::GramType::CHARACTER)
    union = Set['pa', 'ar', 'ra', 'ap', 'ad', 'di', 'is', 'se', 'ag', 'gr', 'ph']
    expect(Section1.union(bi_gram_x, bi_gram_y)).to eq union
    expect(Section1.intersection(bi_gram_x, bi_gram_y)).to eq Set['pa', 'ar', 'ra', 'ap']
    expect(Section1.difference(bi_gram_x, bi_gram_y)).to eq Set['ad', 'di', 'is', 'se']
    expect(bi_gram_x.include?('se')).to eq true
    expect(bi_gram_y.include?('se')).to eq false
  end

  it 'create text by template' do
    expect(Section1.template(12, '気温', 22.4)).to eq '12時の気温は22.4'
  end

  it 'return cipher text' do
    text = 're1Ae'
    encrypt = Section1.cipher(text)
    expect(encrypt).to eq 'iv1Av'
    decrypt = Section1.cipher(encrypt)
    expect(decrypt).to eq text
  end

  it 'shuffle text if its length is 5 over' do
    text = 'I couldn’t believe that I could actually understand what I was reading : ' \
         + 'the phenomenal power of the human mind .'
    result = Section1.typoglycemia(text)
    result_list = result.split(' ')
    expect(result_list.count).to eq 21
    expect(result_list[0]).to eq 'I'
    expect(result_list[3]).to eq 'that'
    expect(result_list[8]).to eq 'what'
    expect(result_list[10]).to eq 'was'
    expect(result_list[19]).to eq 'mind'
    expect(result_list[2][0]).to eq 'b'
    expect(result_list[2][-1]).to eq 'e'
    expect(result_list[5][0]).to eq 'c'
    expect(result_list[5][-1]).to eq 'd'
    expect(result_list[6][0]).to eq 'a'
    expect(result_list[6][-1]).to eq 'y'
    expect(result_list[7][0]).to eq 'u'
    expect(result_list[7][-1]).to eq 'd'
    expect(result_list[18][0]).to eq 'h'
    expect(result_list[18][-1]).to eq 'n'
  end
end
