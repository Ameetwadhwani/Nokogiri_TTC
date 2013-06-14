require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'csv'
require 'openssl'


#Files Being Accessed
@url1 = "http://www.ttc.ca/RSS/Service_Alerts/index.rss"
@url2 = "http://www.ttc.ca/Service_Advisories/all_service_alerts.jsp"
@url3 = '/users/admin/desktop/ttcnotices.html'
@url4 = "https://twitter.com/ttcnotices"
# = '/users/admin/desktop/routes.csv'


# this code will update the historic data with the latest updates.  stretch.  if implemented, refactor since code below is redundant
#q = Nokogiri::HTML(open(@url4, :ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE))
#new_tweets = q.css('p.js-tweet-text').map do |tweet|
#	type_match2 = /^([A-Z ]+):/.match(tweet.text)
#	{
#			:content =>tweet.text,
#	    :type => type_match2 != nil ? type_match[1] : "DISRUPTION"
#
#	}
#end



p = Nokogiri::HTML(open(@url3))
#do this when its multi-line
old_tweets = p.css('p.js-tweet-text').map do |tweet|
	type_match = /^([A-Z ]+):/.match(tweet.text)
	{
			:content => tweet.text,
			:type =>  type_match != nil ? type_match[1] : 'DISRUPTION'
	}
end

# DateTime class with method parse magically converts the string to a date and time!
p.css('.time a').each_with_index do |time, index|
	parse_time = DateTime.parse(time["title"])
	hash = old_tweets[index]
	hash[:datetime] = parse_time
end

tweets = old_tweets



#tweets.each {|value| puts value}   #->   all content {:content=>"47 Lansdowne buses diverting northbound via Davenport, Caledonia due to snow removal at St. Clair and Lansdowne. #TTC", :type=>"DISRUPTION", :datetime=>#<DateTime: 2013-02-13T20:56:00+00:00 ((2456337j,75360s,0n),+0s,2299161j)>}

#tweets.each do |"#{:content}"| puts "#{tweets[type_match]}"     end
#############tweets.select {|tweet| puts tweet[:type] }     # => puts just type


# GOLD #### tweets.select {|tweet| puts tweet[:content] + ', ' + tweet[:type] + ', ' + tweet[:datetime].to_s}

d = tweets.flatten!
puts d
#disruptions = /"DISRUPTION"/.match(d)
#puts disruptions.length



f = File.open('twitter_data', 'w') do |file|
	 file.puts tweets.select {|tweet| tweet[:content] + ', ' + tweet[:type] + ', ' + tweet[:datetime].to_s}
end


#file.print("<html><body>")
#file.print("<p>#{tweets[0][:content]}</p>")
#file.print(:content, :type, :datetime)
#file.print("</body></html>")
#file.print(tweets)


#open(filename [, mode [, perm]] [, opt]) {|file| block } → obj


##
#puts tweets.length
#
#$tweets = tweets


# .map puts the output into an array
#tweets = p.css('p.js-tweet-text').map{|tweet| tweet.text}

# times =


# print times in a new row#########################################
#times = p.css('.time a').each{|time| puts time["title"]}



#a4 = p.css('.time a')[1].each{|time| puts time["title"]}
#a5 = p.css('.js-tweet-text.tweet-text').each{|tweet| puts tweet.text}

#a4 = p.css('.time a').each{|time| puts time["title"]}
#a5 = p.css('.js-tweet-text.tweet-text').each{|tweet| puts tweet.text}

#a4 = p.css('.time a').each{"title"}
#puts a4

#get date and tweet together

############# WORKS!! -- get the content and time of each tweet   ########################
#p = Nokogiri::HTML(open(@url3))
#a4 = p.css('.time a').each{|time| puts time["title"]}
#a5 = p.css('.js-tweet-text.tweet-text').each{|tweet| puts tweet.text}

####################################################################
#puts a5
#a1 = p3.css('p.js-tweet-text')
#a2 = p3.css('a')[1]
#a4 = p3.css('.time a').css('time')

#a4 = p3.css('.time a')   ==>         # <a href="https://twitter.com/TTCnotices/status/301917793618649089" class="tweet-timestamp js-permalink js-nav" title="8:56 PM - 13 Feb 13"><span class="_timestamp js-short-timestamp " data-time="1360817786" data-long-form="true">13 Feb</span></a>

#a1.each{|i| puts "#{i.text}\t#{i.'href']}\t#{i.''}"}

#a4 = p3.css('.time a')[1]["title"]  # => 5:46 AM - 13 Jun 13

#puts a4


#update2 = updates.xpath('//update2:title', 'title' => 'http://www.ttc.ca/RSS/Service_Alerts/index.rss')
#	def ttc_outages_xml
#			@full_update_xml = Nokogiri::XML(open(@url1))
#			@service_updates_xml = @full_update_xml.xpath('//xmlns:description')
#			@update_instance_xml = @full_update_xml.xpath('//xmlns:dc:date')
#	end

######### WORKS ####################
#def ttc_outages_css
#		p = Nokogiri::HTML(open(@url2))
#		alert = p.css('p.veh-replace').inner_text
#		alert2 = p.css('div.alert-content')
#		#puts alert2
#		puts alert

	#end
#####################################


#_____________________
#	def ttc_routes
#		@routes = i
#	end

##_________________________
#ttc_outages_xml
#puts @full_update_xml
#puts @service_updates_xml.inner_text
#puts @update_instance_xml.inner_text     # not getting me the date

#ttc_outages_css
#puts @full_update_html
#puts p.css('title')[0].text
#puts @alert
#puts @full_update_html.css('div#alert-content').inner_text

#page.css("li[data-category='news']")
#
#div class = "alert-content"
#p class = "veh-replace"
#
#
#The <div> element with an id of "funstuff"
#page.css('div#funstuff')[0]
#
#
#The <a> elements nested inside the <div> element that has an id of "reference"
#page.css('div#reference a')
#
#The url of the second <li> element
#page.css('li')[1]['href']

#csv_text = File.read('/users/admin/desktop/routes.csv')
#csv = CSV.parse(csv_text, :headers => true)
#csv.each do |row|
#	Mouldings.create!(row.to_hash)
#end
#puts csv


#CSV.foreach(routes, 'wb') do |row|
#	puts "route name is: #{route_short}"
#end

#
#
#hash = {:key1 => "value1", :key2 => "value2"}
#k = 'key1'
#
#hash[k.to_sym] # or iow, hash[:key1], which will return "value1"
#Rails uses this class called HashWithIndifferentAccess that proves to be very useful in such cases. I know that you've only tagged your question with Ruby, but you could steal the implementation of this class from Rails' source to avoid string to symbol and symbol to string conversions throughout your codebase. It makes the value accessible by using a symbol or a string as a key.
#
#		                                                                                                                                                                                                                                                                                                                                                                                          hash = HashWithIndifferentAccess.new({:key1 => "value1", :key2 => "value2"})
#hash[:key1]  # "value1"
#hash['key1'] # "value1"
#
#
#contact_info.each { |key, value| print key + ' = ' + value + "\n" }
#
#
##!/usr/bin/env ruby
#
#person = { name:'Alice', age:22 }
#
## The "bad" way
#puts "Hello #{person[:name]}, you are #{person[:age]} years old"
#
## The "better" way
#puts "Hello %{name}, you are %{age} years old" % person
#
#h.each_value {|value| puts value }
#
#@fathers.select {|f| f["age"] > 35 }