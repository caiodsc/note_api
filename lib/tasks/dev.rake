namespace :dev do
  desc "Configura o nosso ambiente de desenvolvimento."
  task setup: :environment do
    puts "Cadastrando os contatos..."
    100.times do |i|
      Contact.create!(
                 name:Faker::Name.name,
                 email:Faker::Internet.email,
                 birthdate:Faker::Date.birthday(18, 65)
      )
    end
    puts "Contatos cadastrados com sucesso!"
  end

end
