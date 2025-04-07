class Maintenance
  class OneTimeSchedule
    include ActiveModel::Model

    attr_accessor :start_date, :start_time, :end_date, :end_time

    class << self
      def parse(schedule)
        ice_cube_schedule = IceCube::Schedule.from_ical(schedule)
        new(
          start_date: ice_cube_schedule.start_time.strftime("%Y-%m-%d"),
          start_time: ice_cube_schedule.start_time.strftime("%H:%M"),
          end_date: ice_cube_schedule.end_time.strftime("%Y-%m-%d"),
          end_time: ice_cube_schedule.end_time.strftime("%H:%M")
        )
      end
    end

    def to_schedule
      IceCube::Schedule.new(
        Time.parse("#{start_date} #{start_time}"),
        end_time: Time.parse("#{end_date} #{end_time}")
      ).to_ical
    end
  end
end
