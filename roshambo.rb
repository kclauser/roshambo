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
player_name = nil
player_choice = nil
choices = %w(rock paper scissors)

puts "Welcome to the Roshambo simulator, please enter your name to initialize the simulation."
player_name = gets.chomp.capitalize


if player_name.empty?
  puts "Player not detected, exiting simulation."
  exit
else
  puts "========================================"
  puts "Player detected, welcome #{player_name}"
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

#PUT SOME KIND OF LOOP HERE
begin
  puts "#{player_name}, please type your choice, rock, paper, or scissors."
  player_choice = gets.chomp.downcase
end until choices.include?(player_choice)

computer_choice = rand(3)

puts "You chose #{player_choice}, computer choose #{choices[computer_choice]}"

if player_choice == choices[computer_choice]
  puts "Draw."
elsif player_choice == choices[computer_choice - 1]
  puts "Computer wins"
else
  puts "player wins"
end

puts "this is the player choice"
puts player_choice
puts "this is the ai choice"
puts computer_choice
