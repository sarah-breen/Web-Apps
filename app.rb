require 'sinatra/base'
require 'sinatra/reloader'

class Application < Sinatra::Base
  # This allows the app code to refresh
  # without having to restart the server.
  configure :development do
    register Sinatra::Reloader

    get '/' do
        name = params[:name]

        return "Hello #{name}"
    end

    get '/names' do
        name = params[:name]

        return "#{name}"
    end

    post '/sort-names' do
        name = params[:name]
        name.split(" ").sort.join(" ")

end

    post '/submit' do
        name = params[:name]
        message = params[:message]
        feeling = params[:feeling]

        return "Thanks #{name}, you sent this message: '#{message}', and you are feeling #{feeling}"
    end 
end
end