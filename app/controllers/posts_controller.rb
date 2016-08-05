# Posts INDEX
get '/users/:user_id/posts' do
	@user = User.find(params[:user_id])
	@posts = Post.all
	erb :'posts/index'
end

# Posts NEW
get '/users/:user_id/posts/new' do
	@user = User.find(params[:user_id])
	erb :'posts/new'
end

# Posts SHOW
get '/users/:user_id/posts/:id' do
	@user = User.find(params[:user_id])
	@post = Post.find(params[:id])
	erb :'posts/show'
end

# Posts CREATE
post '/users/:user_id/posts' do
	@user = User.find(params[:user_id])
	@post = Post.new(params[:post])
	if @post.save
		redirect "users/#{@user.id}/posts"
	else
		@errors = @post.errors.full_messages
		erb :'posts/new'
end

# Posts EDIT
get '/users/:user_id/posts/:id/edit'
	@user = User.find(params[:user_id])
	@post = Post.find(params[:id])
	erb :'posts/edit'
end

# Posts UPDATE
put '/users/:user_id/posts/:id'
	@user = User.find(params[:user_id])
	@post = Post.find(params[:id])
	@post
end