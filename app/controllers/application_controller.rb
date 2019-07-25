require 'sinatra/base'

class App < Sinatra::Base


    get '/' do
      erb :'../views/super_hero'
    end

    post '/teams' do
      @team = Team.new(params[:team])

      params[:team][:members].each do |details|
        Member.new(details)
      end

      @name = Member.all.map {|hero| hero.name}
      @power = Member.all.map {|hero| hero.power}
      @bio = Member.all.map {|hero| hero.bio}

      erb :'../views/team'
    end

end
