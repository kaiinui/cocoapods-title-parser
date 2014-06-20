require 'mechanize'
require 'json'

titles = []
@agent = Mechanize.new

(1..530).to_a.each do |i|
  uri = "http://cocoapods.wantedly.com/?page=#{i}"
  page = @agent.get(uri)
  page.search("h3 a").each do |el|
    title = el.text
    puts title
    titles.push title
  end
  wait 5
end

File.open("titles.json", "w") do |f|
  f.write titles.to_s
end