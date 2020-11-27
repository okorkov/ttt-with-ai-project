class Game

    attr_accessor :board, :player_1, :player_2

    def initialize(player_1 = Players::Human.new('X'), player_2 = Players::Human.new('O'), board = Board.new)
        @player_1 = player_1
        @player_2 = player_2
        @board = board
        @board.display
      end

    WIN_COMBINATIONS = [
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8],
        [0, 3, 6],
        [1, 4, 7],
        [2, 5, 8],
        [0, 4, 8],
        [6, 4, 2]
      ]

      def current_player
        move = @board.turn_count
        if move.even?
            @player_1
        else
            @player_2
        end
      end

      def won?
        WIN_COMBINATIONS.each do |win_combo|
            index_0 = win_combo[0]
            index_1 = win_combo[1]
            index_2 = win_combo[2]
        
            position_1 = @board.cells[index_0]
            position_2 = @board.cells[index_1]
            position_3 = @board.cells[index_2]
        
            if position_1 == "X" && position_2 == "X" && position_3 == "X"
              return win_combo
            elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
              return win_combo
            end
          end
          return false
      end

      def draw?
        if self.won? == false && @board.full?
            true
        else
            false
        end
      end

      def over?
        if self.draw?
            true 
        elsif @board.full? && self.won? != false
            true
        elsif self.won? != false && @board.full? == false
            true
        elsif
            false
        end 
      end

      def winner
        index = []
        index = self.won?
        if index == false
          return nil
        else
            if @board.cells[index[0]] == "X"
                return "X"
            else
                return "O"
            end
        end
      end

      def turn
        puts "Please enter a number 1-9:"
        @user_input = current_player.move(@board)
        if @board.valid_move?(@user_input) 
          @board.update(@user_input, current_player)
        else puts "Please enter a number 1-9:"
          @board.display
          turn
        end
        @board.display
      end

      def play
        until self.over?
            self.turn
        end

        if self.won?
            puts "Congratulations #{self.winner}!"
        elsif self.draw?
            puts "Cat's Game!"
        end
      end
end