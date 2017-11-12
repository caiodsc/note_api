namespace :dev do
  desc "Configura o nosso ambiente de desenvolvimento."
  task setup: :environment do
    puts "Setup do banco..."
    %x(rails db:setup)

    puts "Cadastrando os tipos de contato..."

    kinds = %w(Amigo Comercial Conhecido)

    kinds.each do |kind|
      Kind.create!(
          description: kind
      )
    end

    puts "Tipos Contato cadastrados com sucesso!"

    puts "Cadastrando os contatos..."
    100.times do |i|
      Contact.create!(
                 name:Faker::Name.name,
                 email:Faker::Internet.email,
                 birthdate:Faker::Date.birthday(18, 65),
                 kind:Kind.all.sample
      )
    end
    puts "Contatos cadastrados com sucesso!"

    puts "Cadastrando os telefones..."

    Contact.all.each do |contact|
      Random.rand(5).times do |i|
        phone = Phone.create!(number:Faker::PhoneNumber.cell_phone)
        contact.phones << phone
        contact.save!
      end
    end

    puts "Telefones cadastrados com sucesso!"

    puts "Cadastrando os endereços..."

    Contact.all.each do |contact|
      Address.create(
          street: Faker::Address.street_address,
          city: Faker::Address.city,
          contact: contact
      )
    end

    puts "Endereços cadastrados com sucesso!"
  end


end
