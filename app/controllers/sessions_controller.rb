# Sessions NEW
get '/sessions/new' do
 erb :'sessions/new'
end

# Sessions CREATE
post '/sessions' do
#MAKE SURE THIS MATCHES UP WITH PAIR 
 p "*" * 100
 p @user = User.find_by(username: params[:username])
 p "*" * 100
 if @user
   if @user.authenticate(params[:password])
     session[:id] = @user.id
     redirect "/users/#{@user.id}"
   else
   	 @error = "Invalid login information. Please try again."
     redirect 'sessions/new'
   end
 else
   @error = "You are not in the user database. Please sign up." 
   redirect 'users/new'
 end
end

# Sessions DELETE
delete '/sessions/:id' do
 session[:id] = nil
 redirect "/"
end