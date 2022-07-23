class Note < ApplicationRecord
  extend FriendlyId

  belongs_to :user

  friendly_id :title, use: %i[slugged history finders]

  def should_generate_new_friendly_id?
    title_changed? || slug.blank?
  end
end
