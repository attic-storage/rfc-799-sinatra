require 'rubygems'
require 'sinatra'

helpers do
  def eow
    pass if Time.now != time_for('Dec 21, 2012')
    status 799
    headers \
      "Allow"   => "BREW, POST, GET, PROPFIND, WHEN",
      "Refresh" => "Refresh: 20; https://github.com/joho/7XX-rfc"
    body "It's the 'END OF THE WORLD' day, thanks to mayas"
  end
end
# check the 'end of the world' trigger for all routes
get '*' do
  eow()
end

# put your application here
get '/' do
  status 204
end

# if any routes matchs, return HTTP 404 status
get '*' do
  status 404
end
