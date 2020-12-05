class Entry < ApplicationRecord
    belongs_to :user

    validates :date, presence: true
    validates :date, uniqueness: true
    validates :feather, presence: true
    validates :stone, presence: true

end
