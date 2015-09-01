class RockPaperScissors
  CHOICES = %w(rock paper scissors)

  def initialize(player_name)
    @player_name = player_name
    @player_choice = nil
    @draws = @wins = @losses = 0
    @bout_win = @bout_loss = 0
    @play_again = "y"
    @leaderboard_player = @leaderboard_ai = 0
  end

  def boot_sequence(message)
    puts "=" * 41
    puts message
    puts "=" * 41
    puts "..."
  end

  def welcome
    boot_sequence "Player combatant recognized,\nwelcome Gladiator #{@player_name}."

    boot_sequence "Glorious combat module initialized\nPress return to continue boot sequence."
    gets.chomp

    boot_sequence "R.P.S. armory module initialized\nPress return to continue boot sequence."
    gets.chomp

    boot_sequence "Boot sequence complete, prepare to engage\nPress return to continue boot sequence."
    gets.chomp
  end

  def play
    welcome

    until @play_again != "y"
      game
    end
    puts "Return soon, glory awaits!"
  end

  def score
    "Wins: #{@wins}, Losses: #{@losses}, draws: #{@draws}"
  end

  def leaderboard_status
    puts "Current Leaderboard:"
    puts "#{@player_name} match wins: #{@leaderboard_player}"
    puts "AI match wins: #{@leaderboard_ai}"
    puts ""
    puts "Defend your honor! Battle again? (y/n)"
  end

  def repeat_game
    @play_again = gets.chomp.downcase
    keep_playing = @play_again
    if @play_again == "y"
      @draws = @wins = @losses = 0
      @bout_win = 0
      @bout_loss = 0
    end
  end

  def bout_reset
    @wins = @losses = 0
  end

  def file_update
    File.open "leaderboard_#{@player_name}.txt", 'w' do |file|
      file.puts @leaderboard_player
      file.puts @leaderboard_ai
    end
  end

  def game
    begin
      puts "#{@player_name}, it is time to egage the AI in single combat. Please type your weapon of choice: rock, paper, or scissors."
      @player_choice = gets.chomp.downcase
    end until CHOICES.include?(@player_choice)

    if File.exist?("leaderboard_#{@player_name}.txt")
      File.open "leaderboard_#{@player_name}.txt", "r" do |file|
        @leaderboard_player = file.gets.to_i
        @leaderboard_ai = file.gets.to_i
      end
    end

    computer_choice = rand(3)

    puts "You chose #{@player_choice}, AI choose #{CHOICES[computer_choice]}"

    if @player_choice == CHOICES[computer_choice]
      puts "Draw. THERE CAN BE ONLY ONE! Pick again."
      @draws  += 1
      puts score
    elsif @player_choice == CHOICES[computer_choice - 1]
      puts "The AI has triumphed over you."
      @losses += 1
      puts score
    else
      puts "#{@player_name} has beaten the AI in glorious combat!"
      @wins += 1
      puts score
    end

    if @wins == 2
      puts "Bout won!"
      @bout_win += 1
      bout_reset
    elsif @losses == 2
      puts "Bout lost!"
      @bout_loss += 1
      bout_reset
    end

    if @bout_win == 2
      @leaderboard_player += 1
      @leaderboard_ai += 0
      file_update
    end
    puts "Hail the champion, #{@player_name}!"
    leaderboard_status
    repeat_game
  elsif @bout_loss == 2
    @leaderboard_player += 0
    @leaderboard_ai += 1
    file_update
  end
  puts "You have fallen in battle. They will sing no songs of you."
  leaderboard_status
  repeat_game
end
end

puts "Welcome to the Roshambo simulator, v2.2.3. Please enter your name to initialize the simulation."
@player_name = gets.chomp.capitalize
if @player_name.empty?
  puts "Player not detected, exiting simulation."
else
  roshambo = RockPaperScissors.new(@player_name)
  roshambo.play
end
end
