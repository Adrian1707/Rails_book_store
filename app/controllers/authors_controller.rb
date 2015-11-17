class AuthorsController < ApplicationController
	
	before_action :set_post, only: [:show, :edit, :update, :destroy]
	
	def index 
		@authors = Author.all
	end 

	def show 
	
	end 

	def new 
		@author = Author.new 
	end 

	def create 
		@author = Author.new(author_params)
		if @author.save
			flash[:success] = "Author has been created"
			redirect_to @author
		else 
			flash[:danger] = "Author has not been created"
			render :new 
		end
	end 

	def edit 
		
	end 


	def update 
		if @author.update(author_params)
			flash[:success] = "Author has been updated"
			redirect_to @author
		else 
			flash[:danger] = "Author has not been updated"
			render :edit
		end
	end 

	def destroy 
		if @author.destroy
			flash[:success]="Author has been deleted"
			redirect_to authors_path
		end
	end

	private 

	def author_params
		params.require(:author).permit(:first_name, :last_name)
	end 	

	def set_post 
		@author = Author.find(params[:id])
	end 

end
