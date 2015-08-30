@player_name = nil
@player_choice = nil
@draws = @wins = @losses = 0
@bout_win = 0
@bout_loss = 0
@play_again = "y"
@ai_match_wins = 0
@player_match_wins = 0
Choices = %w(rock paper scissors)

puts "Welcome to the Roshambo simulator, v2.2.3. Please enter your name to initialize the simulation."
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
    puts "#{@player_name}, please type your choice: rock, paper, or scissors."
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
    @wins = @losses = 1
  elsif @losses == 2
    puts "Bout lost!"
    @bout_loss += 1
    @wins = @losses = 0
  end

  if @bout_win == 2
    @player_match_wins += 1
    puts "YOU WON!"
    puts "Current Leaderboard:"
    puts "#{@player_name} match wins: #{@player_match_wins}"
    puts "AI match wins: #{@ai_match_wins}"
    puts ""
    puts "Would you like to play again?"
    @play_again = gets.chomp.downcase
    if @play_again == "y"
      @draws = @wins = @losses = 0
      @bout_win = 0
      @bout_loss = 0
    end
  elsif @bout_loss == 2
    @ai_match_wins += 1
    puts "YOU LOST!"
    puts "Current Leaderboard:"
    puts "#{@player_name} match wins: #{@player_match_wins}"
    puts "AI match wins: #{@ai_match_wins}"
    puts ""
    puts "Would you like to play again?"
    @play_again = gets.chomp.downcase
    keep_playing = @play_again
    if @play_again == "y"
      @draws = @wins = @losses = 0
      @bout_win = 0
      @bout_loss = 0
    end
  end
end

game until @play_again != "y"
puts "thanks for playing, come again!"
