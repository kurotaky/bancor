RSpec.describe Bancor do
  let(:bp) { Bancor::Protocol.new(eth: 300000, rate: 1, crr: 0.2) }

  describe '#issue_by_reserve_token' do
    it "issue by 300" do
      expect(bp.issue_by_reserve_token 300).to eq(299.40179372385245)
    end

    it "issue by 300 and subsequently issued 700" do
      bp.issue_by_reserve_token 300
      expect(bp.issue_by_reserve_token 700).to eq(693.9974382206417)
    end
  end

  describe '#destroy_by_reserve_token' do
    it "destroy by 300" do
      expect(bp.issue_by_reserve_token 300).to eq(299.40179372385245)
    end

    it "destroy by 300 and subsequently destroyed 700" do
      bp.destroy_by_reserve_token 300
      expect(bp.destroy_by_reserve_token 700).to eq(0.0)
    end
  end

  describe '#issue_by_smart_token' do
    it "issue by 50" do
      expect(bp.issue_by_smart_token 50).to eq(0.0)
      expect(bp.total_supply).to eq(300050)
    end
  end

  describe '#destroy_by_smart_token' do
    it "destroy by 100" do
      expect(bp.destroy_by_smart_token 100).to eq(0.0)
      expect(bp.total_supply).to eq(299900)
    end
  end
end
