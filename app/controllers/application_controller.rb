class ApplicationController < Sinatra::Base

  set :views, Proc.new { File.join(root, "../views/") }
  register Sinatra::Twitter::Bootstrap::Assets

  get '/' do
    erb :'/application/root'
  end

  get '/figures/new' do
    erb :'figures/new'
  end

  get '/figures/edit' do
    erb :'figures/edit'
  end

  

end
