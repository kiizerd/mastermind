PEG = "\u25CF".encode

class Intro
  def initialize
    main_info()
  end

  def main_info
    header()

    tutorial()
  end

  def header
    puts "\n"
    puts " <[$-======================================================================-$]> "
    puts "  |   #     #                                      #     #                   |  "
    puts "  |   ##   ##   ##    ####  ##### ###### #####     ##   ## # #    # #####    |  "
    puts "  |   # # # #  #  #  #        #   #      #    #    # # # # # ##   # #    #   |  "
    puts "  |   #  #  # #    #  ####    #   #####  #    #    #  #  # # # #  # #    #   |  "
    puts "  |   #     # ######      #   #   #      #####     #     # # #  # # #    #   |  "
    puts "  |   #     # #    # #    #   #   #      #   #     #     # # #   ## #    #   |  "
    puts "  |   #     # #    #  ####    #   ###### #    #    #     # # #    # #####    |  "
    puts " <[$-======================================================================-$]> "
    puts "\n"
  end

  def tutorial
    puts " Breaker has 12 chances to guess the code. 
        \n Code is 4 letters corresponding to colors,
        \n\t#{"R".red}, #{"G".green}, #{"B".blue}, #{"Y".yellow}, #{"M".magenta}, #{"C".cyan}.
        \n Every guess will be given feedback based on how close it is the to the secret code.
        \n\t* => selected color is not used.
        \n\t#{PEG.red} => selected color is used.
        \n\t#{PEG.green} => selected color in selected spot.
        \nAre you ready to start? (1, 2, 3)
        \n [1] - Start Game
        \n [2] - More info 
        \n [3] - Exit game "
    choice = gets.chomp.to_i
    while choice < 1 && choice > 3
      puts "Error. Try again."
      choice = gets.chomp.to_i
    end

    if choice == 1
      puts "[STARTING]"
      sleep(0.1)
      puts "  [GAME]"
      Game.sleepy_dots()
      puts " [MAKING]"
      sleep(0.1)
      puts "  [CODE]"
      Game.sleepy_dots()
      puts `clear`
    elsif choice == 2
      puts "placeholder extra info"
    else 
      puts "Exiting program. \nGoodbye."
      exit
    end
  end
end

class String
  def red
    "\e[31m#{self}\e[0m"
  end

  def green
    "\e[32m#{self}\e[0m"
  end

  def blue
    "\e[34m#{self}\e[0m"
  end

  def yellow
    "\e[33m#{self}\e[0m"
  end

  def magenta
    "\e[35m#{self}\e[0m"
  end

  def cyan
    "\e[36m#{self}\e[0m"
  end
end

