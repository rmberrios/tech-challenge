FactoryBot.define do
  factory :product do
    name { "MyString" }
    ndc { "MyText" }
    qty { 1 }
    price { "9.99" }
    instructions { "MyText" }
  end
end
