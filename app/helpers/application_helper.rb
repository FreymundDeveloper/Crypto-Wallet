module ApplicationHelper
    def date_br(date_us)
        date_us.strftime("%d/%m/%Y")
    end
    
    def ambient_rails
        if Rails.env.development?
            "Develovimento"
        elsif  Rails.env.production?
            "Produção"
        else
            "Teste"
        end
    end
end
