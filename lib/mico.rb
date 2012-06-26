require "mico/version"
require "httparty"
require "json"

module Mico
  class Member
    URL = "http://meurio.org.br/members.json"
    def self.all options = {}
      JSON.parse(HTTParty.get(URL, :query => {:token => ENV["MEURIO_TOKEN"]}.merge(options)).body)
    end
  end

  class Issue
    URL = "http://meurio.org.br/issues.json"
    def self.all
      JSON.parse(HTTParty.get(URL, :query => {:token => ENV["MEURIO_TOKEN"]}).body)
    end
  end
end
