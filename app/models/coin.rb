class Coin < ApplicationRecord
	belongs_to :user
	validates :symbol, presence: true
end
