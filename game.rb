require "./player.rb"
require "./question.rb"
class Game
  
  attr_accessor :curr_player
  attr_reader :players

  def initialize
    @curr_player = 0
    @players = []
  end

  def make_players
    puts "Player 1, please enter name: "
    players.push(Player.new(gets.chomp, 1))
    puts "Player 2, please enter name: "
    players.push(Player.new(gets.chomp, 2))
  end

  def start_game
    puts "\n-----GAME START-----"
    puts "#{players[0].name} is Player 1"
    puts "#{players[1].name} is Player 2"
    while players[0].player_life > 0 && players[1].player_life > 0 do
      puts "\n------ NEW TURN ------"
      self.play_turn
    end

    puts "\n------ GAME OVER ------"
    puts "#{players[curr_player].name} wins with a score of #{players[curr_player].player_life}/3!"
    puts "Good bye!"
  end

  def play_turn
    curr_question = Question.new
    puts "#{players[curr_player].name}, what does #{curr_question.num1} plus #{curr_question.num2} equal?"
    curr_answer = gets.chomp
    if curr_question.validate(curr_answer) == true
      puts "YES! You are correct."
    else
      puts "Seriuosly? No!" 
      players[curr_player].player_life -= 1 
    end
  puts "P1 (#{players[0].name}): #{players[0].player_life}/3 vs P2 (#{players[1].name}): #{players[1].player_life}/3"

  if curr_player == 0
    self.curr_player = 1
  elsif curr_player == 1
    self.curr_player = 0
  end
end
end

