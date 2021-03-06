class ListsController < ApplicationController
  def index
  	@lists = List.all
  end

  def show
  	 @list = List.find(params[:id])
  end

  def new
  	@list = List.new
  end

  def edit
  	@list = List.find(params[:id])
  end

  def create
  	if List.create(list_params)
  		redirect_to lists_path
  	else
  		render :new
  	end
  end

  def update
  	@list = List.find(params[:id])
  	if @list.update(list_params)
  		redirect_to lists_path
  	else
  		render :edit
  	end
  end

  def destroy
  	List.find(params[:id]).destroy
  	redirect_to lists_path
  end

  private

  def list_params
  	params.require(:list).permit(:name)

  end
end
