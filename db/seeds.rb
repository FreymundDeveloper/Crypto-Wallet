# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
=begin
spinner = TTY::Spinner.new("[:spinner] Montando cadastro...")
spinner.auto_spin 

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

spinner.success("Sucesso!") 
=end
