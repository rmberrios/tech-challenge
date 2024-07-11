# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Patient.destroy_all
UsState.destroy_all

Product.destroy_all
Category.destroy_all

STATES.each do |state|
  UsState.create!(
    {
      name: state[0],
      abbr: state[1],
      is_service_offered: state[2],
      minimum_age: state[3]
    })
end

Patient.create!(
  [
    {
      fullname: "Rommel Berrios",
      email: "rommel.berrios@gmail.com",
      birthdate: Date.civil(1990, 10, 4),
      us_state_id: UsState.where(abbr: "MO").first.id

    },
    {
      fullname: "Hollis Vada",
      email: "Frida_Abbott25@hotmail.com",
      birthdate: Date.civil(1995, 10, 4),
      us_state_id: UsState.where(abbr: "CA").first.id

    },
    {
      fullname: "Elissa Salma",
      email: "Ramona48@gmail.com",
      birthdate: Date.civil(1992, 11, 10),
      us_state_id: UsState.where(abbr: "HI").first.id

    },
    {
      fullname: "Amari Orin",
      email: "Hal.Grady26@hotmail.com",
      birthdate: Date.civil(1996, 10, 4),
      us_state_id: UsState.where(abbr: "IN").first.id

    },
    {
      fullname: "Brianne Carrie",
      email: "Rosalyn.Paucek61@gmail.com",
      birthdate: Date.civil(1991, 10, 4),
      us_state_id: UsState.where(abbr: "FL").first.id

    },
  ])

CATEGORIES.each do |category|
  Category.create!({ description: category })
end

PRODUCTS.each do |product|
  Product.create!(
    {
      name: product[:name],
      ndc: product[:ndc],
      qty: product[:qty],
      price: product[:price],
      instructions: product[:instructions],
      category_id: Category.where(description: product[:category]).first.id })
end