class Anagram
  attr_accessor :dictionary

 def initialize(new_dictionary)
	self.dictionary = new_dictionary
 end

 def get_anagrams
  text = []
  self.dictionary.each { |line| text << line.strip }
  
  anagrams = text.group_by {|word| word.downcase.chars.sort.join }

  anagrams.delete_if {|key, value| key.length == 1 }
  
  anagrams.select { |key, values| values.length >= 2 }
 end
end

