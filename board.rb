class Board
  def initialize
    @display =   ["\t\t<[==============]> \n",
                  "\t\t | < >< >< >< > | \n\t\t |   <{    }>   | \n", 
                  "\t\t | < >< >< >< > | \n\t\t |   <{    }>   | \n", 
                  "\t\t | < >< >< >< > | \n\t\t |   <{    }>   | \n",
                  "\t\t | < >< >< >< > | \n\t\t |   <{    }>   | \n",
                  "\t\t | < >< >< >< > | \n\t\t |   <{    }>   | \n", 
                  "\t\t | < >< >< >< > | \n\t\t |   <{    }>   | \n", 
                  "\t\t | < >< >< >< > | \n\t\t |   <{    }>   | \n", 
                  "\t\t | < >< >< >< > | \n\t\t |   <{    }>   | \n", 
                  "\t\t | < >< >< >< > | \n\t\t |   <{    }>   | \n", 
                  "\t\t | < >< >< >< > | \n\t\t |   <{    }>   | \n", 
                  "\t\t | < >< >< >< > | \n\t\t |   <{    }>   | \n", 
                  "\t\t | < >< >< >< > | \n\t\t |   <{    }>   | \n",
                  "\t\t<[==============]>"]
  
  @code_display = ["\t\t<[-----[==]-----]>", 
                   "\t\t | <+><-><*><$> |", 
                   "\t\t<[-----[==]-----]>"] 
  puts @display
  puts @code_display
  @counter = 12
  @code_shown = [false, false, false, false]
  end

  def show_guess(guess)
    c = 6
    guess.each do |i|
      @display[@counter][c] = i
      c += 12
    end
  end
  
  def show_feedback(feedback)
    c = -12
    feedback.each do |i|
      @display[@counter][c] = i
      c += 1
    end
    @counter -= 1
    puts @display
    puts @code_display
  end

  def show_code(num, code)
    case num
    when 0
      if !@code_shown[num]
        @code_display[1][@code_display[1].index("+")] = code
        @code_shown[num] = true
      end
    when 1
      if !@code_shown[num]
        @code_display[1][@code_display[1].index("-")] = code
        @code_shown[num] = true
      end
    when 2
      if !@code_shown[num]
        @code_display[1][@code_display[1].index("*")] = code
        @code_shown[num] = true
      end
    when 3
      if !@code_shown[num]
        @code_display[1][@code_display[1].index("$")] = code
        @code_shown[num] = true
      end
    end
  end
end
