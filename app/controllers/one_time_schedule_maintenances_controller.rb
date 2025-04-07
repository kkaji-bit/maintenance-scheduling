class OneTimeScheduleMaintenancesController < ApplicationController
  before_action :set_maintenance, only: %i[ update ]

  def create
    @maintenance = Maintenance.new(schedulable: Maintenance::OneTimeSchedule.new(schedulable_params))

    if @maintenance.save
      redirect_to maintenance_path(@maintenance), notice: "Maintenance was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @maintenance.schedulable = Maintenance::OneTimeSchedule.new(schedulable_params)

    if @maintenance.save
      redirect_to @maintenance, notice: "Maintenance was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_maintenance
    @maintenance = Maintenance.find(params.expect(:id))
  end

  def schedulable_params
    params.require(:schedulable).permit(:start_date, :start_time, :end_date, :end_time)
  end
end
