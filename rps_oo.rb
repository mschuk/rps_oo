class Player

  attr_accessor :choice, :name

  def initialize(name, choice = '')
    @choice = choice
    @name = name
  end

  def to_s
    "#{name} has #{choice}."
  end

end


class RockPaperScissorGame

  attr_accessor :player, :computer

  CHOICES = {'p' => 'paper', 'r' => 'rock', 's' => 'scissor'}

  def initialize
    self.player = Player.new('Player')
    self.computer = Player.new('Computer')
  end


  def run
    loop do
      get_player_choice
      get_computer_choice
      puts player
      puts computer
      puts winner?(player, computer)

      puts "Play again? Type 'y' to play again"
      keep_playing = gets.chomp

      break if keep_playing.downcase != 'y'
    end
  end

  def get_player_choice
    begin
      puts "Enter 'r', 'p', or 's'"
      player_choice = gets.chomp
    end until CHOICES.keys.include?(player_choice)
    player.choice = CHOICES[player_choice]
  end

  def get_computer_choice
    computer_choice = CHOICES.values.sample
    computer.choice = computer_choice
  end

  def winner?(player, computer)
    if player.choice == computer.choice
      "It's a tie!"
    elsif player_wins?(player.choice, computer.choice)
      puts "Player wins! (#{player.name} beats #{computer.name}) ."
    else
      puts "Computer wins! (#{computer.name} beats #{player.name})."
    end

  end

  def player_wins?(player_choice, computer_choice)
    (player_choice == 'paper' && computer_choice == 'rock')  ||
    (player_choice == 'rock' && computer_choice == 'scissor') ||
    (player_choice == 'scissor' && computer_choice == 'paper')
  end

end

RockPaperScissorGame.new.run