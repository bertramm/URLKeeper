require 'net/http'
require 'net/https'

class PagesController < ApplicationController
  def url
     url = params['url'].nil?  ? "" : CGI::escape(params['url'])
     user = params['user'].nil?  ? "" : CGI::escape(params['user'])
     desc = params['desc'].nil?  ? "" : CGI::escape(params['desc'])
     
     if url != "http://pure-ocean-97.heroku.com/"
       
     
       #url = CGI::escape("Test URL")
       #user = CGI::escape("Test User")
       #desc = CGI::escape("Test desc")
       http = Net::HTTP.new('spreadsheets.google.com',443)
       http.use_ssl = true
       path = '/formResponse?formkey=dHkxU3BVRTZlZXB1X1JET2l5WWVUQXc6MQ&ifq'
       # POST request -> logging in

       data = 'entry.0.single='+url+'&entry.1.single='+desc+'&entry.2.single='+user+'&pageNumber=0&    backupCache=&submit=Submit'

       print data
       headers = { "Content-type" => "application/x-www-form-urlencoded", "Accept"=> "text/plain,application'xhtml+xml,application/xml;q=0.9,*/*;q=0.8 "}

       resp, data = http.post(path, data, headers)


       # Output on the screen -> we should get either a 302 redirect (after a successful login) or an error page
       #puts 'Code = ' + resp.code
       #puts 'Message = ' + resp.message
       #resp.each {|key, val| puts key + ' = ' + val}
       #puts data

     end
  end

end








