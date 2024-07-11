class CreateProductsCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|
      t.string :description

      t.timestamps
    end

    create_table :products do |t|
      t.belongs_to :category, foreign_key: true
      t.string :name
      t.text :ndc
      t.integer :qty
      t.decimal :price, precision: 8, scale: 2
      t.text :instructions

      t.timestamps
    end


  end
end
