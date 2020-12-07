class Entry < ApplicationRecord
    belongs_to :user

    validates :date, presence: true
    validates :date, uniqueness: {scope: :user}
    validates :feather, presence: true
    validates :stone, presence: true

end
