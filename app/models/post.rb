class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
    validate :title_is_sufficiently_clickbait_y

    def title_is_sufficiently_clickbait_y
        clickbait_titles = [/Won't Believe/, /Secret/, /Top \d/, /Guess/]
        if !clickbait_titles.any? {|clickbait_title| clickbait_title.match(self.title)}
            errors.add(:title, "must be sufficiently clickbait-y")
        end
    end
end
