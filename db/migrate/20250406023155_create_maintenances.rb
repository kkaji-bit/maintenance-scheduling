class CreateMaintenances < ActiveRecord::Migration[8.0]
  def change
    create_table :maintenances do |t|
      t.string :schedule_type
      t.string :schedule

      t.timestamps
    end
  end
end
