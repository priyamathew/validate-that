class Event < ActiveRecord::Base
  validates :date, presence: true
  #weak email regex

  validates_format_of :date, with: /\^\d{4}-\d{2}-\d{2}/, :on => :save, :message => 'date format not valid'
  validates :organizer_email, format: { with: /\w+@\w+\.\w+/}
  validates :organizer_name, presence: true
  validates :title, presence: true, uniqueness: true
  validate :date_cannot_be_in_the_past
  

  def date_cannot_be_in_the_past
    if date.present? && date < Date.today
      errors.add(:date, "cannot be in the past") 
    end
  end

end
