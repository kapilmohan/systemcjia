class SurveyController < ApplicationController
	require 'net/http'

	def index
		#Has to be moved elsewhere
		# @survey_user = "kapilonweb@gmail.com"
		# @survey_password = "2zKIAoLjgYSm"
		@survey_user = "jonathanboutelle@gmail.com"
		@survey_password = "Wecando1t2"
		@api_root_uri = "https://fluidsurveys.com:80/api/v3"

		# if user is not logged in then send them to login page (login#index)
		# else

		# assuming user is logged in
		@user = { :id => 123, :email => "superhero@gmail.com", :name => "John Doe" }

		# Fetch survey link using API
		api_request = Net::HTTP::Get.new(@api_root_uri + "/surveys/#{params[:survey_id]}/")
		api_request.basic_auth @survey_user, @survey_password
		api_root = URI(@api_root_uri)
		api_response = Net::HTTP.start(api_root.hostname, api_root.port) {|http|
		  http.request(api_request)
		}.body
		response_json = JSON.parse(api_response)

		@survey_link = response_json["deploy_url"].nil? ? "#" : response_json["deploy_url"].to_s + "?rid=#{@user[:id]}&remail=#{@user[:email]}"
	end

	def captureresponse
		file = "#{Rails.root}/public/responses/data.txt"
		File.open(file, "w") do |f|
			f.write("Jorse #{Time.now}\n\n")
			f.write(params.to_s + "\n\nOK")
		end

	end
end
