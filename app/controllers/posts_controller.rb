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
    erb :"posts/new"
  end

  # need another route for create
  post "/posts" do
    # recieve the params that the user input in the create new post form
    post = Post.create(title: params[:title], image_url: params[:image_url], description: params[:description], user_id: current_user.id)
    # redirect to the post show page
    redirect "/posts/#{post.id}"
  end

  # ORDER MATTERS
  # READ cont.
  # show route for a  single post
  get '/posts/:id' do
    # find the post
    @post = Post.find(params[:id])
    erb :"/posts/show"
  end

  # HOMEWORK

  # UPDATE
  # create link to edit form on post show page
  # get route to render a edit form
  get '/posts/:id/edit' do
    @post = Post.find(params[:id])
    erb :'/posts/edit'
  end

  # `use Rack::MethodOverride` in `config.ru`
  # patch to send our params to and update new post (or resource)
  patch '/posts/:id' do
    @post = Post.find(params[:id])
    @post.update(title: params[:title], image_url: params[:image_url], description: params[:description])
    redirect "/posts/#{@post.id}"
  end

  # DELETE
  # create link to delete on post show page
  # `use Rack::MethodOverride` in `config.ru`
  # delete route to delete our post
  delete '/posts/:id' do
  # we need the id to FIND the post to delete
    @post = Post.find(params[:id])
    @post.destroy
    redirect '/posts'
  end
end
