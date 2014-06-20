require 'json'

titles_str = open("titles.json").read
titles = JSON.parse(titles_str)

nouns = titles.map { |title|
  title.split("-").flat_map { |title| # for 'WebP-iOS-Sample'
    title.split /(?=[A-Z])/ # 'FontAwesome' => 'Font' 'Awesome'
  }.flat_map { |title|
    title.split("+") # for 'UIImage+WebP'
  }.map {|str| str.downcase}.keep_if {|s| s.size > 1} # to avoid vendor prefix
}.flatten

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