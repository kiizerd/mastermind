require_relative 'handle_input'

class Player

  include INPUT

  def initialize
    
  end
  
  def make_code
    nums = []
    code = []
    (1..4).each do |i|
      nums[i - 1] = rand(1..6)
    end
    code = to_color(nums)
  end

  def make_guess
    guess = handle_guess()
  end
  
  def to_color(input)
    result = []
    input.each do |i|
      case i.to_s
      when "1", "R"
        result.push "R".red
      when "2", "G"
        result.push "G".green
      when "3", "B"
        result.push "B".blue
      when "4", "Y"
        result.push "Y".yellow
      when "5", "M"
        result.push "M".magenta
      when "6", "C"
        result.push "C".cyan
      end
    end
    result
  end
end

class Human < Player
  def initialize
  
  end

  def make_code
    code = handle_code()
  end

end

class Computer < Player
  def initialize

  end

  def make_guess
    guess = handle_guess()
  end
end

