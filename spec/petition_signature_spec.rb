require "mico"

describe Mico::PetitionSignature do
  before { ENV["MEURIO_TOKEN"] = "racecarsyayas" }

  describe ".find_all_by_issue_id" do
    let(:signatures_page1){ File.open("spec/support/signatures_page1.json").read }
    let(:signatures_page2){ File.open("spec/support/signatures_page2.json").read }
    let(:signatures_page3){ File.open("spec/support/signatures_page3.json").read }
    before{ stub_request(:get, "http://meurio.org.br/issues/1/signatures.json").with(:query => {:token => ENV["MEURIO_TOKEN"]}).to_return(:body => signatures_page1) }
    before{ stub_request(:get, "http://meurio.org.br/issues/1/signatures.json").with(:query => {:token => ENV["MEURIO_TOKEN"], :page => 2}).to_return(:body => signatures_page2) }
    before{ stub_request(:get, "http://meurio.org.br/issues/1/signatures.json").with(:query => {:token => ENV["MEURIO_TOKEN"], :by_updated_at => "2011-09-20T16:18:27-03:00"}).to_return(:body => signatures_page3) }

    it "should return a hash with the first page of the signatures" do
      Mico::PetitionSignature.find_all_by_issue_id(1).should be_== JSON.parse(signatures_page1)
    end

    it "should return a hash with the second page of the signatures" do
      Mico::PetitionSignature.find_all_by_issue_id(1, :page => 2).should be_== JSON.parse(signatures_page2)
    end

    it "should return a hash of signatures filtered by updated at attribute" do
      Mico::PetitionSignature.find_all_by_issue_id(1, :by_updated_at => "2011-09-20T16:18:27-03:00").should be_== JSON.parse(signatures_page3)
    end
  end
end
