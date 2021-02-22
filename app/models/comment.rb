class Comment < ApplicationRecord
  belongs_to :posts


  def self.persisted
    reject { |comment| comment.new_record? }
  end
end
