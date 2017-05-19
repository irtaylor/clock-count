HOUR_ERROR = "
ERROR: Invalid hour entered.
Hours must be in valid, 24 hr notation, between 00 and 23,
corresponding to midnight and 11pm respectively.

"

MIN_ERROR = "
ERROR: Invalid minutes entered.
Minutes must be between 0 and 59, as in 12:00 to 12:59.

"

class TimeParser
  def self.parse_time(time)
    time_array = time.split(/:/)
    hour = time_array[0].to_i
    min= time_array[1].to_i

    if hour < 0 || hour > 23
      abort(HOUR_ERROR)
    elsif min < 0 || min > 59
      abort(MIN_ERROR)
    end

    return hour, min
  end
end
