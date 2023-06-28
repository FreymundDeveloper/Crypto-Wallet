namespace :dev do
  desc "Configura o ambiente DEV"
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Apagando") { %x(rails db:drop:_unsafe) }
      show_spinner("Criando") { %x(rails db:create) }
      show_spinner("Migrando") { %x(rails db:migrate) }
      %x(rails dev:add_coins) 
      %x(rails dev:add_mining_types) 
    else
      puts "Ambiente DEV requerido."
    end
  end
  
  desc "Cria moedas no BD"
  task add_coins: :environment do
    show_spinner("Realizando o cadastro de moedas...") do
      coins = [
              {
                  description: "Bitcoin",
                  acronym: "BTC",
                  url_image: "https://www.pngplay.com/wp-content/uploads/2/Bitcoin-PNG-Photo-Image.png"
              },
              
              {
                  description: "Ethereum",
                  acronym: "ETH",
                  url_image: "https://w7.pngwing.com/pngs/368/176/png-transparent-ethereum-cryptocurrency-blockchain-bitcoin-logo-bitcoin-angle-triangle-logo-thumbnail.png"
              }
      ]
      
      coins.each do |coin|
        Coin.find_or_create_by!(coin)
      end
    end
  end
  
  desc "Cria tipos de mineração"
  task add_mining_types: :environment do
    show_spinner("Realizando o cadastro de Minerações...") do
      mining_types = [
        {nome: "Proof of Work", acronym: "PoW"},
        {nome: "Proof of Stake", acronym: "PoS"},
        {nome: "Proof of Capacity", acronym: "PoC"}
      ]
      
      mining_types.each do |coin|
        MiningType.find_or_create_by!(mining_types)
      end
    end
  end
  
  private
  
  def show_spinner(msg_start)
    spinner = TTY::Spinner.new("[:spinner] #{msg_start} DB...")
    spinner.auto_spin 
    yield
    spinner.success("Feito!")
  end
  
end
