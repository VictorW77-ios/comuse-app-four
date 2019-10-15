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
    # find the user
    @user = User.find_by(id: params[:id])
    erb :'/users/show'
  end

  # SIGN UP
  # get sign up route that renders signup form
  get '/signup' do
    #render my sign form
    erb :'/users/signup'
  end

  # post sign up route that recieve input data from user, create the user, and logs user in
  post '/users' do
    # will eventually need to add validations to confirm all inputs are filled out before creating user
    @user = User.create(params)
    # post sign up route to create user using params and add key/value pair to sessions hash
    session[:user_id] = @user.id
    # redirect to user profile
    redirect "/users/#{@user.id}"
  end

  # LOG OUT
  # get logout that clears the session hash
  get '/logout' do
    #binding.pry
    session.clear
    #binding.pry
    # redirect to home/landing page
    redirect '/'
  end

end
