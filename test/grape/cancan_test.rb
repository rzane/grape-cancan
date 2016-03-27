require 'minitest/autorun'
require 'rack/test'
require 'grape/cancan'
require 'cancancan'

User = Class.new

class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, User
    cannot :love, User
  end
end

class API < Grape::API
  authorize_routes!
  helpers { define_method(:current_user) { User.new } }
  get('/can') { can? :love, current_user }
  get('/cannot') { cannot? :read, current_user }
  get('/authorize_option', authorize: [:read, User])
  get('/authorize_option_fail', authorize: [:love, User])
  get('/authorize_explicit') { authorize! :read, current_user }
  get('/authorize_explicit_fail') { authorize! :love, current_user }
end

class GrapeCancanTest < Minitest::Test
  include Rack::Test::Methods

  def app
    API
  end

  def test_can
    get '/can'
    assert_equal 'false', last_response.body
  end

  def test_cannot
    get '/cannot'
    assert_equal 'false', last_response.body
  end

  def test_authorize_option
    get '/authorize_option'
    assert_equal 200, last_response.status
  end

  def test_authorize_option_failure
    assert_raises CanCan::AccessDenied do
      get '/authorize_option_fail'
    end
  end

  def test_authorize_explicit
    get '/authorize_explicit'
    assert_equal 200, last_response.status
  end

  def test_authorize_explicit_failure
    assert_raises CanCan::AccessDenied do
      get '/authorize_explicit_fail'
    end
  end
end
