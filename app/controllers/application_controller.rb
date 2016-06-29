require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/posts/new' do
    erb :'new.html'
  end

  post '/posts' do
    Post.create(params)
    # binding.pry
    erb :'posts/:id'
  end

  get '/posts' do
    @posts = Post.all
    erb :'index.html'
  end

  get '/posts/:id' do
    @post = Post.find(params[:id])
    # binding.pry
    erb :'show.html'
  end

  get '/posts/:id/edit' do
    @post = Post.find(params[:id])
    erb :'edit.html'
  end

  patch '/posts/:id' do
    # binding.pry
    @post = Post.find(params[:id])
    name, content = params["name"], params["content"]
    @post.update(name: name, content: content )
    erb :'show.html'
  end

  delete '/posts/:id/delete' do
    # binding.pry
    @post = Post.find(params[:id])
    @post.destroy
    "#{@post.name} was deleted"
    # redirect :'index.html'
  end
end
