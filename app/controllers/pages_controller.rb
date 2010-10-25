require 'net/http'
require 'net/https'

class PagesController < ApplicationController
  def url
     #Define Path to Google Form
     googleURL = 'spreadsheets.google.com'
     #You can find this in the source of your google form
     formPath = '/formResponse?formkey=dHkxU3BVRTZlZXB1X1JET2l5WWVUQXc6MQ&ifq'
     bookmarkletLocation = "http://pure-ocean-97.heroku.com/"

     url = params['url'].nil?  ? "" : CGI::escape(params['url'])
     user = params['user'].nil?  ? "" : CGI::escape(params['user'])
     desc = params['desc'].nil?  ? "" : CGI::escape(params['desc'])
     
     if url != CGI::escape(bookmarkletLocation)
       
     
       #url = CGI::escape("Test URL")
       #user = CGI::escape("Test User")
       #desc = CGI::escape("Test desc")

       http = Net::HTTP.new(googleURL,443)
       http.use_ssl = true

       
       data = 'entry.0.single='+url+'&entry.1.single='+desc+
              '&entry.2.single='+user+'&pageNumber=0&backupCache=&submit=Submit'

       headers = { "Content-type" => "application/x-www-form-urlencoded", 
                   "Accept"=> "text/plain,application'xhtml+xml,application/xml;q=0.9,*/*;q=0.8 "}

       # POST request
       resp, data = http.post(formPath, data, headers)

       #puts 'Code = ' + resp.code
       #puts 'Message = ' + resp.message
       #resp.each {|key, val| puts key + ' = ' + val}
       #puts data

     end
  end

end








