class FiguresController < ApplicationController

  get '/figures/new' do
    erb :'/figures/new'
  end

  get '/figures' do
    erb :'/figures/index'
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])

    if !params[:title][:name].empty?
      @figure.titles << Title.create(params[:title])
    elsif !!params[:figure][:title_ids]
      @figure.titles << Title.find(params[:figure][:title_ids][0])
    end

    if !params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(params[:landmark])
    elsif !!params[:figure][:landmark_ids]
      @figure.landmarks << Landmark.find(params[:figure][:landmark_ids][0])
    end
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'/figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    erb :'/figures/edit'
  end

  post '/figures/:id' do
    @figure = Figure.find(params[:id])
    @figure.update(params[:figure])

    if !params[:title][:name].empty?
      @figure.titles << Title.create(params[:title])
    elsif !!params[:figure][:title_ids]
      @figure.titles << Title.find(params[:figure][:title_ids][0])
    end

    if !params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(params[:landmark])
    elsif !!params[:figure][:landmark_ids]
      @figure.landmarks << Landmark.find(params[:figure][:landmark_ids][0])
    end

    redirect "/figures/#{@figure.id}"
  end

end
