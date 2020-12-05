class User < ApplicationRecord
    has_many :entries

    validates :name, presence: true
    validates :name, uniqueness: true 
end
