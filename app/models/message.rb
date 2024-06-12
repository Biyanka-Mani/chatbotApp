class Message < ApplicationRecord
    belongs_to :user
    validates :body,presence: true,length: {minimum:5,maximum:100}
    scope :custom_display,->{order(:created_at).last(20)}
end
