require 'webmock/rspec'
require "mico"
require "json"

describe Mico::Member do
  before { ENV["MEURIO_TOKEN"] = "racecarsyayas" }

  describe ".all" do
    let(:members_page1){ File.open("spec/support/members_page1.json").read }
    let(:members_page2){ File.open("spec/support/members_page2.json").read }
    let(:members_page3){ File.open("spec/support/members_page3.json").read }
    before{ stub_request(:get, Mico::Member::URL).with(:query => {:token => ENV["MEURIO_TOKEN"]}).to_return(:body => members_page1) }
    before{ stub_request(:get, Mico::Member::URL).with(:query => {:token => ENV["MEURIO_TOKEN"], :page => 2}).to_return(:body => members_page2) }
    before{ stub_request(:get, Mico::Member::URL).with(:query => {:token => ENV["MEURIO_TOKEN"], :by_updated_at => "2011-09-20T16:18:27-03:00"}).to_return(:body => members_page3) }

    it "should return a hash with the first page of members" do
      Mico::Member.all.should be_== JSON.parse(members_page1)
    end

    it "should return a hash with the second page of members" do
      Mico::Member.all({:page => 2}).should be_== JSON.parse(members_page2)
    end

    it "should return a hash of members filtered by updated at attribute" do
      Mico::Member.all({:by_updated_at => "2011-09-20T16:18:27-03:00"}).should be_== JSON.parse(members_page3)
    end
  end
end
