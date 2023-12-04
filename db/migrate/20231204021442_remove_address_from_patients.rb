class RemoveAddressFromPatients < ActiveRecord::Migration[7.0]
  def change
    remove_column :patients, :address, :string
  end
end
