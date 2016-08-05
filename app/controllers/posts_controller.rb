# Posts INDEX
get '/users/:user_id/posts' do
	@user = User.find(params[:user_id])
	@posts = @user.posts
	erb :'posts/index'
end

# Posts NEW
get '/users/:user_id/posts/new' do
	p session[:id]
	@user = User.find(session[:id])
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
	@user = User.find(session[:id])
	@post = Post.new(params[:content])
	if @post.save
		redirect "users/#{@user.id}/posts"
	else
		@errors = @post.errors.full_messages
		erb :'posts/new'
	end
end

# Posts DESTROY
delete '/users/:user_id/posts/:id' do
	@user = User.find(params[:user_id])
	@post = Post.find(params[:id])
	Post.destroy(params[:id])
	redirect '/users/:user_id/posts'
end

# Posts EDIT -- Not used because you can't edit tweets
# get '/users/:user_id/posts/:id/edit'
# 	@user = User.find(params[:user_id])
# 	@post = Post.find(params[:id])
# 	erb :'posts/edit'
# end

# Posts UPDATE -- Not used because you can't edit tweets
# put '/users/:user_id/posts/:id'
# 	@user = User.find(params[:user_id])
# 	@post = Post.find(params[:id])
# 	@post
# end
