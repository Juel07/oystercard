require "station"

describe Station do
  subject(:station) { described_class.new("Heathrow", 6) }

  it "initializes with a name" do
    expect(station.name).to_not be(nil)
  end
  it "initializes with a zone" do
    expect(station.zone).to_not be(nil)
  end

  context "when initialized with incorrect number of arguments" do
    [[], [1], ["1", 2, 3], [1, "2", 3, true]].each do |args|
      it { expect { Station.new(*args) }.to raise_error(ArgumentError) }
    end
  end

  context "when initialized with correct number of arguments" do
    it { expect(station).to be_a(Station) }
  end
end
