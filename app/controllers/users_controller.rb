class UsersController < ApplicationController

  # render login form
  get "/login" do
    erb :login
  end

  # recieve the data (params) from the login form
  post "/login" do
    # find the user
    user = User.find_by(email: params[:email])
    # authenticate the user
    if user && user.authenticate(params[:password])
      # creating a key/value pair in the session hash using the users id to actually log them in
      session[:user_id] = user.id
      # redirect user's profile (users show)
      redirect "/users/#{user.id}"
    else
      # show an error message
      redirect '/login'
    end
  end

  # users SHOW route
  get "/users/:id" do
    "users show page!"
  end

end
