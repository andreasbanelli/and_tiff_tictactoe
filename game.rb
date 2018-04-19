

class Game 

  #le début d'une partie est initialisée, avec 2 joueurs, et le premier joueur qui est aussi le "current player"
    def initialize
        puts "Bienvenu à ce magnifique jeu du morpion !"
        puts "Quel est le nom du joueur 1 ? "
        name_one = gets.chomp
        @player_one = Player.new(name_one, "X")

        puts "Quel est le nom du joueur 2 ?"
        name_two = gets.chomp
        @player_two = Player.new(name_two,"O")

        @board = Board.new
@current_player = @player_one
    end 


# switch_players method  will swap the values of @current_player and @other_player.
def switch_player

    if @current_player == @player_one
        @current_player = @player_two
      else
        @current_player = @player_one

      end 
    end 


      def move
        puts "#{@current_player.name} , where do you want to make your #{@current_player.value} ? (number from 1 to 9)"
        cell = gets.chomp.to_i
            if cell == @board.cell[cell - 1]
                @board.cell[cell - 1] = @current_player.value
            else
                puts "This is not a valid move, please try again!: "
                switch_player
            end
      end
    
      
      
     
      #on crée une boucle pour jouer, on chaque joueur va jouer tour à tour, jusqu'à ce qu'il y ait victoire ou nulle
      def play
        loop do
          @board.display
          move
            if game_over?
                puts " #{@current_player.name} won!"
                play_again
                break
            else
              switch_player
            end
          @board.display
          if game_over_deuce
            puts " deuce !"
            play_again
            break
          else
            puts "#{@current_player.name} your turn to play !"
          end
        end
      end
    
      
      #si qqn gagne cela signifique la partie est terminée
      def game_over?
        @board.is_win? 
      end
      #si toute la grille est remplie, alors il y a égalité
      def game_over_deuce
        @board.cell.all? { |cell| cell.is_a? String }
      end 



      #on propose de relancer une partie 
      def play_again
        print "Do you want to play again ? (Y/n)"
        STDOUT.flush
response = gets.chomp
case response
when "Y" || "y" then Game.new.play
when "N" || "n"  then abort!
end 
end 

end 
