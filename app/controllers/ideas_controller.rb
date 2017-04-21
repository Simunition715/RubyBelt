class IdeasController < ApplicationController
	def index
		@ideas = Idea.all

	end	

	def create
		idea = Idea.new(idea_params.merge(user:User.find(current_user.id)))
		if idea.save
			redirect_to '/ideas'
		else
			flash[:errors] = 'invalid idea!'
			redirect_to :back
		end	
	end	

	def like 
		like = Like.new(user:User.find(current_user.id),idea:Idea.find(params[:id]))
		if like.save
			redirect_to '/ideas'
		else
			redirect_to '/ideas'
		end		
	end	
	def show
		@idea = Idea.find_by(params[:id])
		@users = Idea.find(params[:id]).likers
	end	


	private
		def idea_params
			params.require(:idea).permit(:idea)

		end	
end
