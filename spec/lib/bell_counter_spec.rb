require 'spec_helper'

describe BellCounter do

  it "can access start times and end times" do
    bell_counter = BellCounter.new([12, 3], [15, 7])

    expect(bell_counter.send(:start_hour)).to be 12
    expect(bell_counter.send(:start_min)).to be 3

    expect(bell_counter.send(:end_hour)).to be 15
    expect(bell_counter.send(:end_min)).to be 7

  end

  it "can calculate the number of chimes in a twenty-three-hour-period" do
    bell_counter = BellCounter.new([12, 3], [11, 5])
    expect(bell_counter.count_bells).to be 144
  end

  it "can calculate the number of chimes in a twenty-four-hour-period" do
    bell_counter = BellCounter.new([12, 3], [12, 0])

    expect(bell_counter.send(:twenty_four_hours)).to be 156
    expect(bell_counter.send(:sum_between, (0..23))).to be 156

    expect(bell_counter.count_bells).to be 156
  end

  it "can calculate the number of chimes in a twenty-five-hour-period" do
    bell_counter = BellCounter.new([0,0], [0,0])
    expect(bell_counter.count_bells).to be 168

    bell_counter = BellCounter.new([12,0], [12,0])
    expect(bell_counter.count_bells).to be 168

    bell_counter = BellCounter.new([1,0], [1,0])
    expect(bell_counter.count_bells).to be 157

    bell_counter = BellCounter.new([13,0], [13,0])
    expect(bell_counter.count_bells).to be 157
  end

  it "correctly skips the starting chime when not beginning on the hour" do
    bell_counter = BellCounter.new([12, 3], [15, 5])
    expect(bell_counter.count_bells).to be 6
  end

  it "correctly tells when no chimes will sound" do
    bell_counter = BellCounter.new([12, 3], [12, 5])
    expect(bell_counter.count_bells).to be 0
  end

  it "correctly tells when only the ending time will induce chime" do
    bell_counter = BellCounter.new([12, 3], [13, 5])
    expect(bell_counter.count_bells).to be 1
  end
end
