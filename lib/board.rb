class Board

    def initialize
        @cells = Array.new(9, " ")
    end

    def cells
        @cells 
    end

    def cells=(value)
        @cells = value
    end


    def reset!
        @cells = Array.new(9, " ")
    end

    def display
        puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
        puts "-----------"
        puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
        puts "-----------"
        puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
    end

    def position(input)
        @input = input
        @input = @input.to_i - 1
        @cells[@input]
    end

    def full?
        if @cells.all? {|index| index == "X" || index == "O"}
            true
        else
            false
        end
    end

    def turn_count
        turn = 0
        @cells.each do |index|
            if index == "X" || index == "O"
                turn += 1
            end
        end
        return turn
    end

    def taken?(index)
        index = index.to_i - 1
        if @cells[index].nil? || @cells[index] == " " || @cells[index] == "  "
            false
        else
            true
        end
    end

    def valid_move?(index)
        index = index.to_i - 1
        (0..8).include?(index) && taken?(index + 1) == false
    end

    def update(position, player)
        index = position.to_i - 1
        @cells[index] = player.token
    end

end