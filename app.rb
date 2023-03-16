require './environment'

require "pry"
module FormsLab
  class App < Sinatra::Base
      get '/' do 
      erb :root
      end  
  
      get '/new' do
      erb :"pirates/new"
      end

      

    post '/pirates' do
   
       pirate_name = Pirate.new(params[:pirate][:name], params[:pirate][:weight], params[:pirate][:height])
       @pirate_one = pirate_name
      
      
       params[:pirate][:ship].each do |ship|
      Ship.new(ship[:name],ship[:type], ship[:booty])

      end
    
      @ships = Ship.all
      erb :"pirates/show"
     
    end
  end
end
