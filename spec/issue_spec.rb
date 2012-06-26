require 'webmock/rspec'
require "mico"
require 'iconv'

describe Mico::Issue do
  before { ENV["MEURIO_TOKEN"] = "racecarsyayas" }

  describe ".all" do
    let(:issues_page1){ Iconv.conv('utf-8', 'iso-8859-1', File.open("spec/support/issues_page1.json").read) }
    before{ stub_request(:get, Mico::Issue::URL).with(:query => {:token => ENV["MEURIO_TOKEN"]}).to_return(:body => issues_page1) }

    it "should return a hash with all issues" do
      Mico::Issue.all.should be_== JSON.parse(issues_page1)
    end
  end
end

