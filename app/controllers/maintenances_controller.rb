class MaintenancesController < ApplicationController
  before_action :set_maintenance, only: %i[ show edit destroy ]

  def index
    @maintenances = Maintenance.all
  end

  def show
  end

  def new
    @maintenance = Maintenance.new(schedulable: schedulable.new)
  end

  def edit
  end

  def destroy
    @maintenance.destroy!

    redirect_to maintenances_path, status: :see_other, notice: "Maintenance was successfully destroyed."
  end

  private

    def schedulable
      "Maintenance::#{params[:schedule_type].camelize}".constantize
    end

    def set_maintenance
      @maintenance = Maintenance.find(params.expect(:id))
    end
end
