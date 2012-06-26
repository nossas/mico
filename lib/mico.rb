require "mico/version"
require "httparty"

module Mico
  class Member
    URL = "http://meurio.org.br/members.json"

    def self.all options = {}
      JSON.parse(HTTParty.get(URL, :query => {:token => ENV["MEURIO_TOKEN"]}.merge(options)).body)
    end
  end
end
