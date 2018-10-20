class Api::V1::PostsController < ApplicationController
	
	before_filter :authenticate_user!
	respond_to :json
	
	def index
		user = user.
			posts = Post.order('created_at DESC')
			render json: {status: 'Success', message: 'Loaded Posts', data:posts}, status: :ok
		else
			render json: {status: 'Failed', message: 'User Is Not Signed In', data:"Not Signed In"}, status: :unautheraized
		end
	end

	def show
		post = Post.find(params[:id])
		render json: {status: 'Success', message: 'Loaded Post', data:post}, status: :ok
	end

	def create
		post = Post.new(post_params)
		if post.save
			render json: {status: 'Success', message: 'Post Saved', data:post}, status: :ok
		else
			render json: {status: 'Success', message: 'Post Not Saved', data:post.errors}, status: :unprocessable_entity
		end
	end

	def destroy
		post = Post.destroy(params[:id])
		render json: {status: 'Success', message: 'Post Deleted', data:post}, status: :ok
	end

	def update
		post = Post.find(params[:id])
		if post.update_attributes(post_params)
			render json: {status: 'Success', message: 'Post Updated', data:post}, status: :ok
		else
			render json: {status: 'Success', message: 'Post Not Updated', data:post.errors}, status: :unprocessable_entity
		end
	end

	private
	def post_params
		params.permit(:title, :body)
	end

end
