class Discussion < ApplicationRecord
  belongs_to :user
  belongs_to :chanel
  has_many :replies, depented: :destroy

  validates :title, presence: true
  validates :content, presence: true

end
