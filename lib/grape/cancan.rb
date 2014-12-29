require 'grape'
require 'grape/cancan/version'

module Grape
  module CanCan
    autoload :Helpers,    'grape/cancan/helpers'
    autoload :Authorizer, 'grape/cancan/authorizer'

    Grape::Endpoint.send :include, Grape::CanCan::Helpers
    Grape::API.extend Grape::CanCan::Authorizer
  end
end
