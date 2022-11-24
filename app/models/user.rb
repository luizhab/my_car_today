class User < ApplicationRecord
  has_many :bookings, dependent: :destroy
  has_many :cars, dependent: :destroy
  has_many :bookings_as_owner, through: :cars, source: :bookings

  validates :email, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
