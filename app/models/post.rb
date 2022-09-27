class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 10 }
  validates :summary, length: { maximum: 299 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :non_clickbait

  def non_clickbait
    if title != ('Won\'t Believe' || 'Secret' || 'Top [number]' || 'Guess')
      errors.add(:title, "Won\'t Believe or Secret or Top[number] or Guess")
    end
  end

end
