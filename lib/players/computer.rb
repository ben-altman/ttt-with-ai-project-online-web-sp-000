require 'pry'

module Players

  class Computer < Player
    def move(board)
#      input = rand(1..9)
binding.pry
      input = nil
      if board.cells[0] == " "
        input = "1"
      elsif board.cells[0] != " " && board.cells[4] == " "
        input = "5"
      elsif board.turn_count == 2
        input = [1,3,7,9].find{|e| !board.taken?(e)}.to_s
#  - iterate through WIN_COMBINATIONS. Find a combination with two positions taken by the player's own token.
#  - choose the third position.
      elsif Game::WIN_COMBINATIONS.detect do |combo|
#binding.pry
          if combo.select{|e| board.cells[e]==self.token}.size==2 && combo.any? {|e| board.cells[e]==" "}
            input = combo.select{|e| !board.taken?(e)}.first.to_i.+(1).to_s
#           input = combo.detect{|e| board.cells[e]==" "}
            input+1.to_s
          elsif combo.select{|e| board.cells[e]!=self.token &&
            board.cells[e]!=" "}.count == 2
            input = combo.detect{|e| board.cells[e]==" "}.+1.to_s
          end
        end
      else
        available = board.cells.select {|e| e == " "}
        input = available.sample
      end
    end

  end

end
