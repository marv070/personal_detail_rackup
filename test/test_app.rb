require 'minitest/autorun'
require 'rack/test'
require_relative '../app.rb'
class Testapp < Minitest::Test
        include Rack::Test::Methods
    def app
        PersonalDetailsApp
    end
    def test_ask_name_on_entry_page
        get '/'
        assert(last_response.ok?)
        assert(last_response.body.include?('Hello, what is your name?'))
        assert(last_response.body.include?('<input type = "text" name = "name_input">'))
        assert(last_response.body.include?('<form method = "post" action = "/name">'))
        assert(last_response.body.include?('<input type="submit" value="submit">'))
    end
    def test_to_put_name
      post '/name', name_input: 'Marvin'
      follow_redirect!
      assert(last_response.body.include?('Marvin'))
      assert(last_response.ok?)
    end
    def test_to_get_age
      get '/age?name=Marvin'
      assert(last_response.body.include?('Hello,Marvin! How old are you?'))
      assert(last_response.body.include?('<input type = "number" name = "age_input">'))
      assert(last_response.body.include?('<form method = "post" action = "/age">'))
      assert(last_response.ok?)
    end
    def test_to_put_age
      post '/age', age_input:'34', name_input:'marv'
      follow_redirect!
      assert(last_response.body.include?('34'))
      assert(last_response.ok?)
    end




end
