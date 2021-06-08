class Oystercard
  attr_reader :balance, :entry_station, :exit_station, :journeys

  MAX_LIMIT = 90
  MIN_LIMIT = 1
  FARE = 2

  def initialize
    @balance = 0
    @journeys = {}
  end

  def top_up(money)
    max_topup_limit
    @balance += money
  end

  def in_journey?
    !!@entry_station
  end

  def touch_in(station)
    check_min_balance
    @entry_station = station
  end

  def touch_out(station)
    deduct(FARE)
    @exit_station = station
    store_journey
    @entry_station = nil
  end

  def store_journey
    @journeys[:entry_station] = @entry_station
    @journeys[:exit_station] = @exit_station
  end

  private

  def deduct(money)
    @balance -= money
  end

  def max_topup_limit
    raise "Pound #{MAX_LIMIT} limit reached!" if @balance >= MAX_LIMIT
  end

  def check_min_balance
    raise "You have insufficient funds!" if @balance == MIN_LIMIT
  end
end

# oyster1 = Oystercard.new
# p oyster1.store_journey
