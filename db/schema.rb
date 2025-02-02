# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2024_07_11_042050) do

  create_table "categories", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "patients", force: :cascade do |t|
    t.integer "us_state_id"
    t.string "fullname"
    t.string "email"
    t.date "birthdate"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_patients_on_email", unique: true
    t.index ["us_state_id"], name: "index_patients_on_us_state_id"
  end

  create_table "products", force: :cascade do |t|
    t.integer "category_id"
    t.string "name"
    t.text "ndc"
    t.integer "qty"
    t.decimal "price", precision: 8, scale: 2
    t.text "instructions"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_products_on_category_id"
  end

  create_table "us_states", force: :cascade do |t|
    t.string "name"
    t.string "abbr"
    t.boolean "is_service_offered"
    t.integer "minimum_age"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["abbr"], name: "index_us_states_on_abbr", unique: true
  end

  add_foreign_key "patients", "us_states"
  add_foreign_key "products", "categories"
end
