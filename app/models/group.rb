class Group < ApplicationRecord
  # Your existing code for the Group model...
  belongs_to :user
  has_and_belongs_to_many :account_records, dependent: :destroy

  validates :name, presence: true, length: { in: 4..250 }
  validates :icon, presence: true, length: { in: 4..250 }

  def self.created_by_current_user(user)
    where(user:)
  end
end
