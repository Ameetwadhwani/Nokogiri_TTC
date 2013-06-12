TTC Fail:

Pull the TTC feed for outages using Nokogiri. Parse based on route.  Send to people based on their selected route


Data sources:
	list of routes:  http://transit.toronto.on.ca/bus/8108.shtml
	list of outages: http://www.ttc.ca/RSS/Service_Alerts/index.rss
	list of service alerts:  http://www.ttc.ca/Service_Advisories/all_service_alerts.jsp


Needs:
1)	website where users can sign-up for alerts
2)	sign-up form for users to select their routes
3)	Authentication to save selections and get permission to send
4)	Poll the RSS feed for updates – take the update and create the Pulse
5)	Web host for the app (Heroku)?



Gems and libraries:
a)	typeahead.js
b)	gem: Twitter
	a.	OAUth
	b.	DM
c)	Gem: Nokogiri


Stretch:
	•	 display the location of the outage / highlight the route using Google Maps


Nitty Gritty:

		1) Parsing the ttc.ca service alerts website
