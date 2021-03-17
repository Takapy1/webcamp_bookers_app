class Book < ApplicationRecord
  validates :title, presence: true, on: [:create, :update]
  validates :body, presence: true, on: [:create, :update]
end
