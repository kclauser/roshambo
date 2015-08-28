player_name_array = Array.new
rps = ["rock", "paper", "scissors"].sample

puts "Welcome to the Roshambo simulator, please enter your name."
player_name = gets.chomp

player_name_array << player_name unless player_name.empty?

if player_name_array.length == 1
    puts "player detected"
else
  puts "no player"
end

puts "this is the length: #{player_name_array.length}"
puts "this is the player name: #{player_name_array}"
puts rps
