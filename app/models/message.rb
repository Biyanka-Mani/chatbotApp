class Message < ApplicationRecord
    belongs_to :user
    validates :body,presence: true,length: {minimum:5,maximum:100}
end
