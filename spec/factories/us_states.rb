FactoryBot.define do
  factory :us_state do
    name { "MyString" }
    abbr { "MyString" }
    is_service_offered { false }
    minimum_age { 1 }
  end
end
