module Api
	module V1
		class JobApplicationsController < ApplicationController
			
			def index
				app = JobApplication.order('created_at DESC')
				render json: {status: 'Success', message: 'Loaded Applications', data:app}, status: :ok
			end

			def show
				app = JobApplication.find(params[:id])
				render json: {status: 'Success', message: 'Loaded app', data:app}, status: :ok
			end

			def create
				app = JobApplication.new(app_params)
				if app.save
					render json: {status: 'Success', message: 'Application Saved', data:app}, status: :ok
				else
					render json: {status: 'Success', message: 'Application Not Saved', data:app.errors}, status: :unprocessable_entity
				end
			end

			def destroy
				app = JobApplication.destroy(params[:id])
				render json: {status: 'Success', message: 'Application Deleted', data:app}, status: :ok
			end

			def update
				app = JobApplication.find(params[:id])
				if app.update_attributes(app_params)
					render json: {status: 'Success', message: 'Application Updated', data:app}, status: :ok
				else
					render json: {status: 'Success', message: 'Application Not Updated', data:post.errors}, status: :unprocessable_entity
				end
			end

			private
			def app_params
				params.permit(:data, :status)
			end

		end
	end
end
	