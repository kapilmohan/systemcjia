class MainController < ApplicationController

	def index
		# if user is not logged in then send them to login page
		# else

		# assuming user is logged in
		@user = { :id => 123, :email => "superhero@gmail.com", :name => "John Doe" }

		
	end
end
