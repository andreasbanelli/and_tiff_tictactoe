class Player 
    #On crée notre joueur avec 2 attributs un nom et une valeur (la valeur pourra être O ou X)
    attr_accessor :name, :value

    def initialize(name,value)
        @name = name
        @value = value
        
    end
end 