class CreateUsStatesPatients < ActiveRecord::Migration[6.1]
  def change

    create_table :us_states do |t|
      t.string :name
      t.string :abbr
      t.boolean :is_service_offered
      t.integer :minimum_age

      t.timestamps
    end

    add_index :us_states, :abbr, unique: true

    create_table :patients do |t|
      t.belongs_to :us_state, foreign_key: true
      t.string :fullname
      t.string :email
      t.date :birthdate

      t.timestamps
    end
    add_index :patients, :email, unique: true
  end
end
