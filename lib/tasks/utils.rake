namespace :utils do
  desc "Popular banco de dados"
  task seed: :environment do
    
   puts "Gerando os contatos [Contacts].."
    100.times do |i|
    Contact.create!(
      name: Faker::Name.name , 
      email: Faker::Internet.email , 
      kind: Kind.all.sample ,
      rmk: LeroleroGenerator.sentence([1,2,3].sample) 
      )
    end
   puts "Utils :seed Contacts [Ok].." 
 
  puts "Gerando os endereços [Adrresses].."
    Contact.all.each do |contact|
    Address.create!(
      street: Faker::Address.street_address , 
      city: Faker::Address.city , 
      state: Faker::Address.state_abbr ,
      contact: contact
      )
    end
   puts "Utils :seed Addresses [Ok].." 

   puts "Gerando os telefones [Phones].."
     Contact.all.each do |contact|
        rand(1..3).times do|i|
      Phone.create!(
        phone: Faker::PhoneNumber.phone_number , 
        contact: contact
      )
      end
    end
   puts "Utils :seed Phones [Ok].." 
     
  end
end
