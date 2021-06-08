class Oystercard
  attr_reader :balance, :entry_station

  MAX_LIMIT = 90
  MIN_LIMIT = 1
  FARE = 2

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(money)
    max_topup_limit
    @balance += money
  end

  def in_journey?
    @in_journey
  end

  def touch_in(station)
    min_balance
    @in_journey = true
    @entry_station = station
  end

  def touch_out
    deduct(FARE)
    @in_journey = false
  end

  private

  def deduct(money)
    @balance -= money
  end

  def max_topup_limit
    raise "Pound #{MAX_LIMIT} limit reached!" if @balance >= MAX_LIMIT
  end

  def min_balance
    raise "You have insufficient funds!" if @balance == MIN_LIMIT
  end
end

# oyster1 = Oystercard.new
# p oyster1.top_up(10)
