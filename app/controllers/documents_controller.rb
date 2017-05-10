class DocumentsController < ApplicationController
  def index
    @documents = Document.all
  end

  def search
    if params[:query]
      @documents = Document.search(params[:query]).records.to_a
    else
      @documents = nil
    end
  end
end
