require 'pry'
class BellCounter

  def initialize(start_time, end_time)
    @start_hour = start_time[0]
    @start_min = start_time[1]

    @end_hour = end_time[0]
    @end_min = end_time[1]
  end

  def count_bells
    num_bells = 0

    if start_hour == end_hour
      # Start Times Are Equal
      if start_min == end_min
        if start_min == 0
          # Both Start Times are On The Hour 12:00 --> 12:00
          num_bells = twenty_four_hours + end_hour % 12
          num_bells += 12 if start_hour % 12 == 0
        else
          # Both Start Times are Off The Hour 12:05 --> 12:05
          num_bells = twenty_four_hours
        end

      # Same hour, different minutes, start minutes less than end minutes
      elsif start_min < end_min
        if start_min == 0
          # E.g. 12:00 --> 12:05
          num_bells = start_hour % 12
          num_bells += 12 if start_hour % 12 == 0
        else
          # E.g. 12:01 --> 12:05
          num_bells = 0
        end

        # Same hour, different minutes, start minutes greater than end minutes
      elsif start_min > end_min # E.g. 12:05 --> 12:00 or 12:05 --> 12:01
          num_bells = twenty_four_hours
      end

    elsif start_hour < end_hour
      if start_min == 0 # 1:00 --> 3:05
        num_bells = sum_between( (start_hour..end_hour) )
      else # 1:05 --> 3:05
        num_bells = sum_between( ((start_hour + 1)..end_hour) )
      end

    elsif start_hour > end_hour
      adjusted_end = end_hour + 24
      if start_min == 0 # 23:00 --> 1:05
        num_bells = sum_between( (start_hour..adjusted_end) )
      else # 23:05 --> 1:05
        num_bells = sum_between( ((start_hour+1)..adjusted_end) )
      end
    end
    return num_bells
  end

  private

    def twenty_four_hours
      return sum_between(0..23)
    end

    def sum_between(interval)
      sum = 0
      interval.each do |i|
        sum += 12 if i % 12 == 0
        sum += i % 12 if i % 12 != 0
      end
      return sum
    end

    def start_hour
      @start_hour
    end

    def start_min
      @start_min
    end

    def end_hour
      @end_hour
    end

    def end_min
      @end_min
    end
end
