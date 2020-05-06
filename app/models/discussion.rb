class Discussion < ApplicationRecord
  belongs_to :user
  belongs_to :channel
  has_many :replies, dependent: :destroy

  validates :title, presence: true, length: {minimum: 3, maximum: 50}
  validates :content, presence: true

end
