class AddFieldsToPatientApi < ActiveRecord::Migration[7.0]
  def change
    add_column :patient_apis, :disability_type, :string
    add_column :patient_apis, :race, :string
    add_column :patient_apis, :ethnicity, :string
  end
end
