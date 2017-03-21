require "client_authenticator/version"
require 'client_authenticator/client_authenticable'
require 'client_authenticator/model/api_client'
require 'client_authenticator/railtie'
require 'client_authenticator/test_helpers'

module ClientAuthenticator
  require "client_authenticator/railtie" if defined?(Rails)
end
