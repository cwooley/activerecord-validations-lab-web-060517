class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :summary, length: {in: (0..250)}
  validates :content, length: {minimum: 250}
  validates :category, inclusion: ['Fiction', 'Non-fiction']
  validate :clickbait
  def clickbait
    if self.title
      unless self.title.include?("Won't Believe") || self.title.include?("Secret") || self.title.include?("Guess")
        errors.add(:Category, 'category must be either Fiction or Non-fiction')
      end
    end
  end
end
