require "oystercard"

describe Oystercard do
  it "When intialised, the balance is zero" do
    expect(subject.balance).to eq(0)
  end
end
