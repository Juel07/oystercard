require "oystercard"

describe Oystercard do
  it "When intialized, the balance is zero" do
    expect(subject.balance).to eq(0)
  end

  describe "#top_up" do
    it "can top up the balance" do
      # expect(subject.top_up(10)).to eq(10)
      expect { subject.top_up 10 }.to change { subject.balance }.by 10
    end
    it "raise error if max limit reached" do
      max_limit = Oystercard::MAX_LIMIT
      error_msg = "Pound #{max_limit} limit reached!"
      subject.top_up(max_limit)
      expect { subject.top_up(10) }.to raise_error(error_msg)
    end
  end

  describe "#deduct" do
    it "can deduct from balance" do
      subject.top_up(20)
      expect { subject.deduct 10 }.to change { subject.balance }.by -10
    end
  end

  it "is not a journey to start" do
    expect(oystercard).not_to be_in_journey
  end

  it "can touch in" do
    oystercard.touch_in
    expect(oystercard).to be_in_journey
  end

  it "can touch out" do
    oystercard.touch_in
    oystercard.touch_out
    expect(oystercard).not_to be_in_journey
  end
end
