require 'json'

titles_str = open("titles.json").read
titles = JSON.parse(titles_str)
nouns = []

titles.each do |title|
  nouns += title.split("-").map { |title|
    title.split /(?=[A-Z])/
  }.flatten.map { |title|
    title.split("+")
  }.flatten.map {|str| str.downcase}.keep_if {|s| s.size > 1}
end

noun_count = Hash.new(0)

nouns.each do |noun|
  noun_count[noun] += 1
end

nouns.uniq!

result = nouns.map do |noun|
  [
      noun,
      noun_count[noun]
  ]
end
result.sort! {|i, j| j[1] <=> i[1]}
result.keep_if {|r| r[1] >= ARGV[0].to_i}

File.open("nouns.json", "w") do |f|
  f.write result.to_s
end

puts result.size