require_relative 'board'
require_relative 'players'
require_relative 'intro'
require_relative 'handle_input'

class Game

  include INPUT

  def initialize
    puts `clear`
    show_intro()
  end

  def show_intro
    @intro = Intro.new
    @board = Board.new

    play_game()
  end

  def update_display
    @board.show_guess(@guess)
    @board.show_feedback(@feedback)
  end
  
  def get_code
    @code = @codemaker.make_code
  end
  
  def get_guess
    @guess = @codebreaker.make_guess
  end
  
  def feedback
    @feedback = []
    @guess.each_with_index do |val, ind|
      if val == @code[ind]
        @feedback[ind] = PEG.green
        @board.show_code(ind, @code[ind])
      elsif @code.include? val
        @feedback[ind] = PEG.red
      else
        @feedback[ind] = "*"
      end
    end
  end
  
  def play_game
    handle_players()
    get_code()
    @counter = 12
    while @counter > 0
      get_guess()
      
      feedback()
      puts `clear`
      @intro.header
      update_display()

      if @guess == @code
        game_end(2)
        break
      end

      @counter -= 1
    end
    if @counter == 0
      game_end(1)
    end
  end

  def game_end(winner)
    if winner == 1
      puts "\n Code Maker wins!"
    end
    if winner == 2
      puts "\n Code Breaker wins!"
    end
  end

  def self.sleepy_dots
    puts "    ."
    sleep(0.1)
    puts "   ..."
    sleep(0.1)
    puts "  ....."
    sleep(0.1)
    puts "   ..."
    sleep(0.1)
    puts "    ."
    sleep(0.1)
  end
end
