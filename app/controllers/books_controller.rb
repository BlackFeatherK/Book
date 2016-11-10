class BooksController < ApplicationController

	before_action :find_params , :only => [:edit , :update , :destroy]

	def index
		@books = Book.page(params[:page]).per(10)
		@book = Book.find_by_id(params[:edit_id]) || Book.new
	end

	def show
		@book = Book.find(params[:id])
	end

	def new
		@book = Book.new
	end

	def create
		@book = Book.new( book_params )
		if @book.save
			flash[:notice] = "新增成功"
			redirect_to books_path
		else
			render "new"
		end
	end

	def edit

	end

	def update

		if @book.update( book_params )
			flash[:notice] = "更新成功"
			redirect_to books_path
		else
			render "edit"
		end
	end

	def destroy
		@book.destroy
		flash[:alert] = "刪除成功"
		redirect_to books_path(:page => params[:page])
	end





	private

	def book_params
		params.require(:book).permit(:name , :description , :isbn)
	end

	def find_params
		@book = Book.find(params[:id])
	end
end
