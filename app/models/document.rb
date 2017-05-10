#require 'elasticsearch/model'

class Document < ActiveRecord::Base
  mount_uploader :document_attachment, DocumentAttachmentUploader

  # doesn't work
  # http://rny.io/rails/elasticsearch/2013/08/05/full-text-search-for-attachments-with-rails-and-elasticsearch.html
  # Setting up ElasticSearch integration
  # include Tire::Model::Search
  # include Tire::Model::Callbacks
  #
  # mapping _source: { excludes: ['attachment'] } do
  #   indexes :id, type: 'integer'
  #   indexes :title
  #   indexes :attachment, type: 'attachment'
  # end
  #
  # def attachment
  #   path_to_attachment = document_attachment.file.file
  #   Base64.encode64(open(path_to_attachment) { |file| file.read })
  # end
  #
  # def to_indexed_json
  #   to_json(methods: [:attachment])
  # end


  # http://stackoverflow.com/questions/36500827/elasticsaerch-rails-cant-search-for-mac-extensions
  # elasticsearch-rails
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  settings index: { number_of_shards: 3 } do
   mappings do
     indexes :title
     indexes :attachment, type: 'attachment'
   end
  end

  def as_indexed_json(options={})
    self.as_json({
      methods: [:attachment]
    })
  end

  def attachment
    path_to_attachment = document_attachment.file.file
    Base64.encode64(open(path_to_attachment) { |file| file.read })
  end
end
Document.import(force: true)
