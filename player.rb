class Player
  attr_accessor :player_life
  attr_reader :name, :number
  def initialize(name, num)
    @name = name
    @number = num
    @player_life = 3
  end
end