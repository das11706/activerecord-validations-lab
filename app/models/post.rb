class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 10 }
  validates :summary, length: { maximum: 299 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :non_clickbait

  TITLE = [ 
    /Won't Believe/i, 
    /Secret/i,
    /Top [0-9]*/i,
    /Guess/i,
  ]

  def non_clickbait
    if TITLE.none? {|pattern| pattern.match title}
      errors.add(:title, "Won\'t Believe or Secret or Top[number] or Guess")
    end
  end

#   def non_clickbait
#     if title != ('Won\'t Believe' || 'Secret' || 'Top [number]' || 'Guess')
#     # unless title.include?('Won\'t Believe' || 'Secret' || 'Top [number]' || 'Guess') 
#     # validates :title, inclusion: { in: %w('Won\'t Believe' 'Secret' 'Top [number]' 'Guess') }
#     # validates :title, presence: true
#       errors.add(:title, "Won\'t Believe or Secret or Top[number] or Guess")
#     end
#   end


end
