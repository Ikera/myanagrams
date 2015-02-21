class Anagrams

 def initialize(filename)
	@filename = filename
 end

 def anagrams_reader
  text = []
  File.read("#{@filename}").each_line { |line| text << line.chop }

  anagrams = text.group_by {|word| word.chars.sort}.values

  selected_anag = anagrams.select { |e| e.length >= 2 }

  each_row_anagrams = selected_anag.each do |arr| 
  	arr.each { |inner| print inner << " " } 
    print "\n" 
  end
  # Checking do I have 20683 sets of anagrams
  puts each_row_anagrams.length
 end
end

file_name = Anagrams.new("anagrams-wordlist.txt")
file_name.anagrams_reader



	 