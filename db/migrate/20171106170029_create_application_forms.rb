class CreateApplicationForms < ActiveRecord::Migration
  def change
    create_table :application_forms do |t|
      t.string :name
      t.string :description

      t.timestamps null: false
    end
  end
end
