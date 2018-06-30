class EntriesController < ApplicationController
  before_action :get_entry, only: [:show, :edit, :update]

  def index
    @entries = Entry.all
  end

  def new
    @entry = Entry.new
  end

  def show
  end

  def create
    entry = Entry.create(entry_params)
    redirect_to(entry_path(entry))
  end

  def edit
  end


  def update
    @entry.update(entry_params)
    redirect_to(entry_path(@entry))
  end

  private

  def get_entry
    @entry = Entry.find(params['id'])
  end

  def entry_params
    params["entry"].permit("title", "contents")
  end
end
