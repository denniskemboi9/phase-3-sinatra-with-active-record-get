class ApplicationController < Sinatra::Base

  get '/' do
    { message: "Hello world" }.to_json
  end

  get '/games' do
    # get all the games from the database
    games = Game.all
    # return a JSON response with an array of all the game data
    games.to_json
  end

  get '/games/:id' do
    game = Game.find(params[:id])

    # include associated reviews in the JSON response
    game.to_json(include: :reviews)
  end
end
