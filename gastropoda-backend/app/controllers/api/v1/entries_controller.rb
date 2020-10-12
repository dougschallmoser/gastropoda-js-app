class Api::V1::EntriesController < ApplicationController
  def index
    entries = Entry.all 
    render json: entries, status: 200
  end

  def show
    entry = Entry.find_by(id: params[:id])
    render json: entry, status: 200
  end

  def create
    entry = Entry.new(entry_params)
    if entry.save 
      render json: entry, status: 200
    end
  end

  def destroy
  end

  private

  def entry_params
    params.require(:entry).permit(:title, :content, :author_name, :author_bio, :likes, :comments, :image)
  end
end
