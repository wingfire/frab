FactoryGirl.define do
  
  sequence :email do |n|
    "test#{n}@example.com"
  end

  sequence :conference_acronym do |n|
    "frabcon#{n}"
  end

  factory :user do
    email { Factory.next(:email) }
    password "frab23"
    password_confirmation { password }
    confirmed_at { Time.now }
  end

  factory :person do
    email { Factory.next(:email) }
    first_name "Fred"
    last_name "Besen"
    gender "male"
  end

  factory :conference do
    title "FrabCon"
    acronym { Factory.next(:conference_acronym) }
    timeslot_duration 15
    default_timeslots 4
    max_timeslots 20
    first_day { Date.today.since(60.days).to_date }
    last_day { Date.today.since(62.days).to_date }
  end

  factory :call_for_papers do
    start_date { Date.today.ago(1.days) }
    end_date { Date.today.since(6.days) }
    conference
  end

  factory :availability do
    conference
    person
    day { conference.days.first }
    start_time "08:00"
    end_time "20:00"
  end

  factory :language do
    code "EN"
    
    factory :english_language do
    end
    factory :german_language do
      code "DE"
    end
  end

  factory :event do
    title "Introducing frab"
    subtitle "Getting started organizing your conference"
    time_slots 4
    start_time "10:00"
    conference
  end

  factory :event_person do
    person
    event 
    event_role "speaker"
  end

  factory :event_rating do
    event
    person
    rating 3.0
    comment "blah"
  end

  factory :event_feedback do
    event
    rating 3.0
    comment "doh"
  end

end

