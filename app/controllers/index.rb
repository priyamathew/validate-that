get '/' do
  @events = Event.all
  erb :index
end

get '/events/:id/show' do |id|
  @event = Event.find(id)
  erb :event_show
end

get '/events/new' do
  @event = Event.new
  erb :new
end

post '/events/create' do
  @event = Event.new(params[:event])
  @specific_errors = {}
  if @event.save
    redirect "/events/#{@event.id}/show"
  else
    @errors = @event.errors.full_messages
    @specific_errors = @event.errors
    erb :new
  end
  # Event.create(params[:event])
end
