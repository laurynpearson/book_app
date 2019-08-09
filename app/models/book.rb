class Book < ApplicationRecord
  validates :pages, presence: true
  validates :title, presence: true
end
