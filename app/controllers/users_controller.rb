get '/users' do
  @users = User.all
  erb :"users/index"
end

get '/users/new' do
  erb :"users/new"
end

post '/users' do
  @user = User.new(params[:user])
  if @user.save
    session[:id] = @user.id
    redirect "/users/#{@user.id}"
  else
    @errors = @user.errors.full_messages
    erb :"users/new"
  end
end

get '/users/:id' do
  @user = User.find(params[:id])
  # This should really just render erb :'/posts/index'
  erb :"/posts/index"
end

# Users Search
get '/users/search' do
  erb :'users/search'
end

# Users search results
get '/users/search/results' do
  
end