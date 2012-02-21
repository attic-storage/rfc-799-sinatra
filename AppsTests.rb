require 'apps'
require 'test/unit'
require 'rack/test'

ENV['RACK_ENV'] = 'test'

class AppsTests < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_normal_day
    get '/'
    assert_equal 204, last_response.status
  end

  def test_wrong_route
    get '/wrong_route'
    assert_equal 404, last_response.status
  end
end
