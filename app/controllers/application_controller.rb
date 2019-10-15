require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    # enables the sessions hash
    enable :sessions
    # set a session secret for an extra layer of security
    set :session_secret, "super_secret_session"
  end

  get "/" do
    erb :welcome
  end

  helpers do

    # returns a boolean if the user is logged in or not
    # def logged_in?

    # keeps track of the logged in user
    def current_user
      User.find_by(id: session[:user_id])
    end

  end

end
