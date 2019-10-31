class PostsController < ApplicationController

  # CRUD

  # READ
  # index route for all posts
  get '/posts' do
    # leverage the model to get all posts from our database
    @posts = Post.all
    # render all posts
    erb :'posts/index'
  end

  # CREATE
  # render a form to create a new post
  get "/posts/new" do
    if logged_in?
      erb :"posts/new"
    else
      # show the error message
      flash[:error] = "You must be logged in to create a post!"
      redirect "/"
    end
  end

  # need another route for create
  post "/posts" do
    # recieve the params that the user input in the create new post form
    post = Post.new(title: params[:title], image_url: params[:image_url], description: params[:description], user_id: current_user.id)
    if post.save
    # ^ if valid input — .save triggers our validation
    #if params[:title] != "" && params[:description] != "" && params[:image_url] != ""
      # show post creation success message
      flash[:message] = "Created post successfully!"
      # redirect to the post show page
      redirect "/posts/#{post.id}"
    else
      # show post creation error message
      flash[:error] = "Post creation failed: #{post.errors.full_messages.to_sentence}"
      redirect "/posts/new"
    end
  end

  # ORDER MATTERS
  # READ cont.
  # show route for a  single post
  get '/posts/:id' do
    # find the post
    @post = Post.find(params[:id])
    erb :"/posts/show"
  end

  # CREATE

  # UPDATE
  # create link to edit form on post show page
  # get route to render a edit form
  get '/posts/:id/edit' do
    @post = Post.find(params[:id])
    if authorized_to_edit?(@post)
      erb :'/posts/edit'
    else
      # show an error message
      flash[:error] = "Not authorized to edit that post!"
      redirect "/posts"
    end
  end

  # `use Rack::MethodOverride` in `config.ru`
  # patch to send our params to and update new post (or resource)
  patch '/posts/:id' do
    @post = Post.find(params[:id])
    @post.update(title: params[:title], image_url: params[:image_url], description: params[:description])
    redirect "/posts/#{@post.id}"
  end

  # DELETE
end
