class Camper < ApplicationRecord
  has_many :signups, dependent: :destroy
  has_many :activities, through: :signups

  # must have a name
  validates :name, presence: true
  # validates_presence_of :name

#   age must be between 8-18
    validates :age,  inclusion: {in: 8..18}

end
