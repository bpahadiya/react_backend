class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
    	t.string :first_name
      t.string :last_name
      t.date :dob, null: false
      t.string :contact_number
      t.integer :role, null: false

      t.timestamps
    end
  end
end
