require 'rubygems'
require 'nokogiri'
require 'open-uri'

#< Nokogiri::XML::Node


	@url1 = "http://www.ttc.ca/RSS/Service_Alerts/index.rss"


#update2 = updates.xpath('//update2:title', 'title' => 'http://www.ttc.ca/RSS/Service_Alerts/index.rss')
	def ttc_outages_xml
			@full_update_xml = Nokogiri::XML(open(@url1))
			@service_updates_xml = Nokogiri::XML(open(@url1)).xpath('//xmlns:description')
			@update_instance_xml = Nokogiri::XML(open(@url1)).xpath('//xmlns:description')
	end

	def ttc_outages_css



	end

	def ttc_routes
		@routes = i
	end

#_________________________
ttc_outages
puts @full_update
puts @service_updates.inner_text


