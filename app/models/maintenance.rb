class Maintenance < ApplicationRecord
  before_save :set_schedule_type
  before_save :set_schedule

  def schedulable=(schedulable)
    @schedulable = schedulable
    self.schedule_type = schedulable.class.name
  end

  def schedulable
    @schedulable ||= schedule_type.constantize.parse(schedule)
  end

  def set_schedule_type
    self.schedule_type = schedulable.class.name
  end

  def set_schedule
    self.schedule = schedulable.to_schedule
  end
end
