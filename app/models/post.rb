class Post < ApplicationRecord
    belongs_to :user
    validates :user_id, presence: true
    validates :title, :body, presence: true
end
