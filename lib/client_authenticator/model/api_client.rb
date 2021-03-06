require 'active_record'

module ClientAuthenticator
  class ApiClient < ActiveRecord::Base
    self.table_name = ClientAuthenticator.configuration.table_name
    validates_uniqueness_of :client_id
    validates_presence_of :client_id, :pass_key
    before_validation :generate_pass_key, on: :create

    def self.authenticated?(client_id, pass_key)
      !where(client_id: client_id, pass_key: pass_key).empty?
    end

    private

    def generate_pass_key
      self.pass_key = Digest::SHA1.hexdigest("#{client_id}-#{Time.now.to_i}-#{rand}")
    end
  end
end

