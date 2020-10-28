module INPUT
  def handle_players
    puts "\nHow many human players? (0, 1, 2) - Default is 0
          \n [0] - Two Computers, playing eachother
          \n [1] - One person, playing a Computer
          \n [2] - Two people, playing eachother"
    players = gets.chomp.to_i
    while players > 2 || players < 0
      puts "Error, input outside bounds. (0, 1, 2)"
      players = gets.chomp.to_i
    end
    case players
    when 0
      @codemaker = Computer.new
      @codebreaker = Computer.new
    when 1
      puts "Would you like to make or break a code?"
      role = gets.chomp.downcase
      while role != 'break' && role != 'make'
        puts "Error, try again. Make or Break?"
      end
      if role == 'break'
        @codebreaker = Human.new
        @codemaker = Computer.new
      else
        @codebreaker = Computer.new
        @codemaker = Human.new
      end
    when 2
      @player1 = Human.new
      @player2 = Human.new
    end
  end

  def handle_ready
  
  end

  def handle_guess
    letter = /^(R|G|B|Y|M|C){4,4}$/
    number = /^[1-6]{4,4}$/
    puts "\tMake your guess.", "Enter 4 letters (R, G, B, Y, M, C) or numbers (1-6)."
    guess = gets.chomp.split('')
    while guess.length != 4
      puts "Error, wrong input length. 4 characters needed, try again."
      guess = gets.chomp.split('')
    end
    while (!guess.join.match? number) && (!guess.join.upcase.match? letter)
      puts "Error, wrong input type. Enter 4 letters (R, G, B, Y, M, C) or numbers (1-6)."
      guess = gets.chomp.split('')
    end
    if guess.join.match? number
      puts "gottem"
      result = to_color(guess)
    elsif guess.join.upcase.match? letter
      puts "gottem again"
      guess = guess.join.upcase.split('')
      result = to_color(guess)
    else
      puts "didnt get em"
    end
    guess = result
  end

  def handle_code
    letter = /^(R|G|B|Y|M|C){4,4}$/
    number = /^[1-6]{4,4}$/
    puts "Input secret code...", "Enter 4 letters (R, G, B, Y, M, C) or numbers (1-6)."
    code = gets.chomp.split('')
    while code.length != 4
      puts "Error, wrong input length. 4 characters needed, try again."
      code = gets.chomp.split('')
    end
    while (!code.join.match? number) && (!code.join.upcase.match? letter)
      puts "Error, wrong input type. Enter 4 letters (R, G, B, Y, M, C) or numbers (1-6)."
      code = gets.chomp.split('')
    end
    if code.join.match? number
      puts "gottem"
      result = to_color(code)
    elsif code.join.upcase.match? letter
      puts "gottem again"
      code = code.join.upcase.split('')
      result = to_color(code)
    else
      puts "didnt get em"
    end
    code = result
  end
end
