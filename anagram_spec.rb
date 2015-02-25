require 'rspec'
require './anagram'

describe Anagram do 

  it "returns hash with anagrams" do
    input_dictionary = ["abc", "dca", "cba"]
    expected_result = {"abc" => ["abc", "cba"]}
    expect(Anagram.new(input_dictionary).get_anagrams).to eq(expected_result)
  end

  it "populates dictionary with given one" do
    dictionary = ["kuca", "stan", "drvo"]
    anagram = Anagram.new(dictionary)
    expect(anagram.dictionary).to eq(dictionary)
  end

  it "strips white space from word" do
    dictionary = [" abc ", "acb  ", " bde "]
    expected_result = {"abc" => ["abc", "acb"]}
    expect(Anagram.new(dictionary).get_anagrams).to eq(expected_result)
  end

  # ABC == cba
  it "ignores letter case" do
    all_dictionary = ["abc", "ACB", "acv"]
    expected_result = {"abc" => ["abc", "ACB"]}
    expect(Anagram.new(all_dictionary).get_anagrams).to eq(expected_result)
  end

  # ABC's == SC'AB
  it "ignores everything except letters" do
    strange_dictionary = ["ABC's", "SC'AB", "dcs"]
    expected_result = {"'abcs" => ["ABC's", "SC'AB"]}
    expect(Anagram.new(strange_dictionary).get_anagrams).to eq(expected_result)
  end
  # This also ignores equal words with one character, like 'a' and 'a'
  it "ignores words with one character" do
    one_ch_dictionary = ["a", "a", "b", "abc", "bca"]
    expected_result = { "abc" => ["abc", "bca"]}
    expect(Anagram.new(one_ch_dictionary).get_anagrams).to eq(expected_result)
  end

  it "ignores words without anagrams" do
    no_anagrams_words = ["ako", "abc", "bca"]
    expected_result = {"abc" => ["abc", "bca"]}
    expect(Anagram.new(no_anagrams_words).get_anagrams).to eq(expected_result)
  end
end

