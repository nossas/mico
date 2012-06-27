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

  class PetitionSignature
    def self.find_all_by_issue_id issue_id, options = {}
      JSON.parse(HTTParty.get("http://meurio.org.br/issues/#{issue_id}/signatures.json", :query => {:token => ENV["MEURIO_TOKEN"]}.merge(options)).body)
    end
  end
end
