require 'rubygems'
require 'nokogiri'
require 'open-uri'

File.open('books.txt', 'w') do |f|
	page = Nokogiri::HTML(open("http://www.amazon.com"))
	books = page.css('table tr td:first­child span')
	books.each do |book|
		f.write(“<div>” + book + "</div>\n")
	end

end
end

