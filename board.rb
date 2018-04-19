class Board
    #notre tableau est défini par 9 cellules
    attr_accessor :cell


    def initialize
        @cell = *(1..9)
        #il est important de mettre * afin d'obtenir 1, 2, 3...9 comme variable
      end
    

   
#On affiche le tableau pour le jeu
    def display
        puts "#{@cell[0..2].join(" | ")}"
        puts "---------"
        puts "#{@cell[3..5].join(" | ")}"
        puts "---------"
        puts "#{@cell[6..8].join(" | ")}"
    
    end 
    #ici on regarde les combinaisons gagantes
    def is_win?
        cell[0] == cell[1] && cell[1] == cell[2] ||
            cell[3] == cell[4] && cell[4] == cell[5] ||
            cell[6] == cell[7] && cell[7] == cell[8] ||
            cell[0] == cell[3] && cell[3] == cell[6] ||
            cell[1] == cell[4] && cell[4] == cell[7] ||
            cell[2] == cell[5] && cell[5] == cell[8] ||
            cell[0] == cell[4] && cell[4] == cell[8] ||
            cell[2] == cell[4] && cell[4] == cell[6]
        end
    
end 