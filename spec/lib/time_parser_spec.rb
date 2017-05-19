require 'spec_helper'

describe TimeParser do

  it "correctly parses hours and minutes" do
    hour, min = TimeParser.parse_time("12:00")
    expect(hour).to be 12
    expect(min).to be 00

    hour, min = TimeParser.parse_time("13:05")
    expect(hour).to be 13
    expect(min).to be 05
  end

  it "aborts when an invalid time is parsed" do
    expect{TimeParser.parse_time("25:00")}.to raise_error SystemExit
    expect{TimeParser.parse_time("23:73")}.to raise_error SystemExit
  end
end
