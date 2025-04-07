module MaintenancesHelper
  def schedulable_maintenance_path(maintenance)
    "/#{maintenance.schedule_type.demodulize.underscore}_maintenances/#{maintenance.id}"
  end

  def schedulable_maintenances_path(maintenance)
    "/#{maintenance.schedule_type.demodulize.underscore}_maintenances"
  end

  def edit_schedulable_maintenance_path(maintenance)
    "/#{maintenance.schedule_type.demodulize.underscore}_maintenances/#{maintenance.id}/edit"
  end
end
