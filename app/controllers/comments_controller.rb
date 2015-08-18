class CommentsController < ApplicationController
	before_action :authenticate_user!

	def create
		@opinion = Opinion.find(params[:opinion_id])
		@comment = Comment.create(params[:comment].permit(:content))
		@comment.user_id = current_user.id
		@comment.opinion_id = @opinion.id

		if @comment.save
			redirect_to opinion_path(@opinion)
		else
			render 'new' # redirect_to opinion_path(@opinion), notice: 'Opps! Something went wrong! Please try again.'
		end
	end
end