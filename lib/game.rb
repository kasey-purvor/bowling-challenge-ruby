require_relative './frame'
require_relative './player'

class Game
  attr_reader :whos_turn, :frame_number, :player

  def initialize
    @player = Player.new

  end

  def play(roll_1:, roll_2: 0)
    frame = Frame.new(roll_1: roll_1, roll_2: roll_2)
    @player.add_score(roll_1: frame.roll_1, roll_2: frame.roll_2, total: frame.total) 
  end

  def self.instance
    @game ||= self.new
  end 

private

end
