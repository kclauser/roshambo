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
  puts "Player not detected, exiting simulator."
  exit
else
  puts "========================================"
  puts "Player detected, welcome #{@player_name}"
  puts "========================================"
  puts "..."
  puts "========================================"
  puts "Glorious combat module initialized"
  puts "Press return to continue boot sequence."
  puts "========================================"
  puts "..."
  gets.chomp
  puts "========================================"
  puts "RPS weapons module initialized"
  puts "Press return to continue boot sequence."
  puts "========================================"
  puts "..."
  gets.chomp
  puts "========================================"
  puts "Boot sequence complete, prepare to engage"
  puts "Press return to continue boot sequence."
  puts "========================================"
  puts "..."
end

def game

  leaderboard_player = 0
  leaderboard_ai = 0

  if File.exist?("leaderboard.txt")
    File.open "leaderboard.txt", "r" do |file|
      leaderboard_player = file.gets.to_i
      leaderboard_ai = file.gets.to_i
    end
  end

  begin
    puts "#{@player_name}, it is time to egage the AI in single combat. Please type your weapon of choice: rock, paper, or scissors."
    @player_choice = gets.chomp.downcase
  end until Choices.include?(@player_choice)

  computer_choice = rand(3)

  puts "You chose #{@player_choice}, AI choose #{Choices[computer_choice]}"

  if @player_choice == Choices[computer_choice]
    puts "Draw. THERE CAN BE ONLY ONE! Pick again."
    @draws  += 1
    puts "Wins: #{@wins}, Losses: #{@losses}, draws: #{@draws}"
  elsif @player_choice == Choices[computer_choice - 1]
    puts "The AI has triumphed over you."
    @losses += 1
    puts "Wins: #{@wins}, Losses: #{@losses}, draws: #{@draws}"
  else
    puts "#{@player_name} has beaten the AI in glorious combat!"
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

  if @bout_win == 2
    ##Leaderboard file part
    leaderboard_player += 1
    leaderboard_ai += 0
    File.open "leaderboard.txt", 'w' do |file|
      file.puts leaderboard_player
      file.puts leaderboard_ai
    end
    puts "Hail the champion, #{@player_name}!"
    puts "Current Leaderboard:"
    puts "#{@player_name} match wins: #{leaderboard_player}"
    puts "AI match wins: #{leaderboard_ai}"
    puts ""
    puts "Would you like to play again?"
    @play_again = gets.chomp.downcase
    if @play_again == "y"
      @draws = @wins = @losses = 0
      @bout_win = 0
      @bout_loss = 0
    end
  elsif @bout_loss == 2
    ##Leaderboard file part
    leaderboard_player += 0
    leaderboard_ai += 1
    File.open "leaderboard.txt", 'w' do |file|
      file.puts leaderboard_player
      file.puts leaderboard_ai
    end
    puts "You have fallen in battle. They will sing no songs of you."
    puts "Current Leaderboard:"
    puts "#{@player_name} match wins: #{leaderboard_player}"
    puts "AI match wins: #{leaderboard_ai}"
    puts ""
    puts "Claim your honor! Battle again? (y/n)"
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
puts "RPS coliseum simulation complete, exiting."
