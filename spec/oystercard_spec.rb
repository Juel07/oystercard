require "oystercard"

describe Oystercard do
  subject(:oystercard) { described_class.new }
  let(:entry_station) { double :entry_station }
  let(:exit_station) { double :exit_station }

  it "When intialized, the balance is zero" do
    expect(oystercard.balance).to eq(0)
  end

  describe "#top_up" do
    it "can top up the balance" do
      # expect(subject.top_up(10)).to eq(10)
      expect { oystercard.top_up 10 }.to change { oystercard.balance }.by 10
    end
    it "raise error if max limit reached" do
      max_limit = Oystercard::MAX_LIMIT
      error_msg = "Pound #{max_limit} limit reached!"
      oystercard.top_up(max_limit)
      expect { oystercard.top_up(10) }.to raise_error(error_msg)
    end
  end

  #   it "can deduct from balance" do
  #     oystercard.top_up(20)
  #     expect { oystercard.deduct 10 }.to change { oystercard.balance }.by -10
  #   end
  context "When starting journey" do
    it "is not a journey to start" do
      expect(oystercard).not_to be_in_journey
    end
    it "can touch in" do
      oystercard.touch_in(entry_station)
      expect(oystercard).to be_in_journey
    end
    it "can check minimum balance on touch in" do
      min_limit = Oystercard::MIN_LIMIT
      error_msg = "You have insufficient funds!"
      oystercard.top_up(min_limit)
      expect { oystercard.touch_in(entry_station) }.to raise_error(error_msg)
    end
    it "can store the entry station" do
      oystercard.touch_in(entry_station)
      expect(oystercard.entry_station).to eq entry_station
    end
  end

  context "When ending journey" do
    it "can touch out" do
      oystercard.touch_in(entry_station)
      oystercard.touch_out
      expect(oystercard).not_to be_in_journey
    end
    it "can charge for the journey" do
      fare = Oystercard::FARE
      oystercard.touch_in(entry_station)
      expect { oystercard.touch_out }.to change { oystercard.balance }.by -fare
    end
  end
end
