class FiguresController < ApplicationController
  get '/figures/new' do
    erb :'figures/new'
  end

  post '/figures' do
    @figure = Figure.create(params["figure"])

    if params['title']['name'].size > 0

      @title = Title.create(params['title'])
      @figure_title = FigureTitle.create
      @figure_title.title_id = @title.id
      @figure_title.figure_id = @figure.id
      @figure_title.save
    end

    if params['figure']['title_ids']
      params['figure']['title_ids'].each do |ti|
      @figure_title = FigureTitle.create
      #binding.pry
      #@figure_title.title_id = ti
      #@figure_title.figure_id = @figure.id
      #@figure_title.save
      end
    end
#binding.pry
      if params['landmark']['name'].size > 0

        @landmark = Landmark.create(params['landmark'])
        @landmark.figure_id = @figure.id
        @landmark.save
      end
      #binding.pry
      if params['figure']['landmark_ids']
        params['figure']['landmark_ids'].each do |li|
          @landmark = Landmark.find(li)
          @landmark.figure_id = @figure.id
          @landmark.save
        end
      end

    redirect to "/figures"
  end

  get '/figures' do
    erb :'/figures/index'
  end

  get '/figures/edit' do
    erb :'/figures/edit'
  end

  get '/figures/:id' do

    @figure = Figure.find(params['id'])
    erb :'/figures/show'
  end
  get "/figures/:id/edit" do
    @figure = Figure.find(params['id'])
    erb :'/figures/edit'
  end

  post '/figures/:id'do
  @figure = Figure.find(params['id'])
  @figure.update(params['figure'])

  if !params['title']['name'].empty?
    @figure.titles << Title.create(params['title'])
  end

  if !params['landmark']['name'].empty?
    @figure.landmarks << Landmark.create(params['landmark'])
  end

  redirect to("/figures/#{@figure.id}")
  binding.pry
  end
end
