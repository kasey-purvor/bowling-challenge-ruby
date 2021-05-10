require './lib/game'
require 'sinatra/base'
require 'json'

class Bowling_scores_app < Sinatra::Base
  enable :sessions

  get '/' do 
    File.read('public/index.html')
  end


  post '/input_result' do 
    game = Game.instance
    roll_1, roll_2 = params[:roll_1], params[:roll_2]
    game.play(roll_1: roll_1.to_i, roll_2: roll_2.to_i)
    p "inout results visibility"
    p game
  end

  get '/update' do 
    game = Game.instance
    {player_score: game.player.score,
    player_bonus: game.player.bonus,
    player_points: game.player.points,
    player_total: game.player.total,
    frame_number: game.player.frame_number,
    status: 200
    }.to_json

  end 
  
  run! if app_file == $0
end 