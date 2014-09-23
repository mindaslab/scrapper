require 'rubygems'
require 'bundler/setup'
Bundler.require(:default)

BASE_URL = "http://gurpz.com"
page = Nokogiri::HTML(open(BASE_URL))

title = page.css("title").text
parah_first = page.css("p").first.text
images = page.css("img")

puts "Title: #{title}"
puts "Parah: #{parah_first}"

puts "____ IMAGES ____"
images.each do |image|
  url = image["src"]
  puts URI.join( BASE_URL, url ).to_s
end

