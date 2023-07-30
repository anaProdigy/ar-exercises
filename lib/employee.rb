class Employee < ActiveRecord::Base
  belongs_to :store
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :hourly_rate, numericality: { only_integer: true, in: 40..200  }
  
  before_create :set_random_password

  private
    def set_random_password
      self.password = SecureRandom.hex(4)
    end

end

