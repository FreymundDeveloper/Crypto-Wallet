namespace :dev do
  desc "Configura o ambiente DEV"
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Apagando") { %x(rails db:drop:_unsafe) }
      show_spinner("Criando") { %x(rails db:create) }
      show_spinner("Migrando") { %x(rails db:migrate) }
      show_spinner("Populando") { %x(rails db:seed) }
    else
      puts "Ambiente DEV requerido."
    end
  end
  
  def show_spinner(msg_start)
    spinner = TTY::Spinner.new("[:spinner] #{msg_start} DB...")
    spinner.auto_spin 
    yield
    spinner.success("Feito!")
  end
  
end
