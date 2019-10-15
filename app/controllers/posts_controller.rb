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

  # show route for a  single post
  get '/posts/:id' do
    # find the post 
    @post = Post.find(params[:id])
    erb :"/posts/show"
  end

  # CREATE

  # UPDATE

  # DELETE
end
