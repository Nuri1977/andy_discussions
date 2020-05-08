class Discussion < ApplicationRecord
  belongs_to :user
  belongs_to :channel
  has_many :replies, dependent: :destroy

  validates :title, presence: true, length: {minimum: 3, maximum: 50}
  validates :content, presence: true

  resourcify

  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]

  def should_generate_new_friendly_id?
    title_changed?
  end

end
