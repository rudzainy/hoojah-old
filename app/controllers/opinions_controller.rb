class OpinionsController < ApplicationController
	before_action :find_post, only: [:show, :edit, :update, :destroy, :vote_option1, :vote_option2]
	before_action :authenticate_user!, except: [:index, :show]

	def index
		@opinion = Opinion.all.order("created_at DESC")
	end

	def show
		@comments = Comment.where(opinion_id: @opinion)
	end

	def new
		@opinion = current_user.opinions.build
	end

	def create
		@opinion = current_user.opinions.build(post_params)

		if @opinion.save
			redirect_to @opinion, notice: "Successfully created post!"
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @opinion.update(post_params)
			redirect_to @opinion
		else
			render 'edit'
		end
	end

	def destroy
		@opinion.destroy
		redirect_to root_path
	end

	def vote_option1
		@opinion.upvote_by current_user
		redirect_to :back
	end

	def vote_option2
		@opinion.downvote_by current_user
		redirect_to :back
	end

	private

	def find_post
		@opinion = Opinion.find(params[:id])
	end

	def post_params
		params.require(:opinion).permit(:title, :option1, :option2, :image)
	end
end
