# player_name_array = Array.new
# rps = ["rock", "paper", "scissors"].sample
#
# puts "Welcome to the Roshambo simulator, please enter your name to start the game."
# player_name = gets.chomp
#
# player_name_array << player_name unless player_name.empty?
#
# if player_name_array.length == 1
#     puts "player detected"
# else
#   puts "no player"
# end #==========================================================================
@player_name = nil
@player_choice = nil
@draws = @wins = @losses = 0
@bout_win = 0
@bout_loss = 0
Choices = %w(rock paper scissors)

puts "Welcome to the Roshambo simulator, please enter your name to initialize the simulation."
@player_name = gets.chomp.capitalize


if @player_name.empty?
  puts "Player not detected, exiting simulation."
  exit
else
  puts "========================================"
  puts "Player detected, welcome #{@player_name}"
  puts "========================================"
  puts "..."
  puts "========================================"
  puts "Player throw module initialized"
  puts "Press return to continue boot sequence."
  puts "========================================"
  puts "..."
  gets.chomp
  puts "========================================"
  puts "Prediction module initialized"
  puts "Press return to continue boot sequence."
  puts "========================================"
  puts "..."
  gets.chomp
  puts "========================================"
  puts "Boot sequence complete, prepare to throw"
  puts "Press return to continue boot sequence."
  puts "========================================"
  puts "..."
end

def game
  begin
    puts "#{@player_name}, please type your choice, rock, paper, or scissors."
    @player_choice = gets.chomp.downcase
  end until Choices.include?(@player_choice)

  computer_choice = rand(3)

  puts "You chose #{@player_choice}, computer choose #{Choices[computer_choice]}"

  if @player_choice == Choices[computer_choice]
    puts "Draw."
    @draws  += 1
    puts "Wins: #{@wins}, Losses: #{@losses}, draws: #{@draws}"
  elsif @player_choice == Choices[computer_choice - 1]
    puts "Computer wins"
    @losses += 1
    puts "Wins: #{@wins}, Losses: #{@losses}, draws: #{@draws}"
  else
    puts "player wins"
    @wins += 1
    puts "Wins: #{@wins}, Losses: #{@losses}, draws: #{@draws}"
  end

  if @wins == 2
    puts "Bout won!"
    @bout_win += 1
    @wins = @losses = 0
  elsif @losses == 2
    puts "Bout lost!"
    @bout_loss += 1
    @wins = @losses = 0
  end
end

game until @bout_win == 2 || @bout_loss == 2

puts "this is the player choice"
puts @player_choice
puts "this is the ai choice"
puts computer_choice
