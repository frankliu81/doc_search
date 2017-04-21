class Document < ActiveRecord::Base
  mount_uploader :document_attachment, DocumentAttachmentUploader
end
