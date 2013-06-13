require 'rubygems'
require 'nokogiri'
require 'open-uri'

#< Nokogiri::XML::Node

#Files Being Accessed
@url1 = "http://www.ttc.ca/RSS/Service_Alerts/index.rss"
@url2 = "http://www.ttc.ca/Service_Advisories/all_service_alerts.jsp"
@url3 = '/users/admin/desktop/ttcnotices.html'
routes = '/users/admin/desktop/routes.txt'

# get the content and time of each tweet
p3 = Nokogiri::HTML(open(@url3))
#a4 = p3.css('.time a').each{|time| puts time["title"]}


#a5 = p3.css('.js-tweet-text.tweet-text').each{|tweet| puts tweet.text}


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