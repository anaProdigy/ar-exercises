class Store < ActiveRecord::Base
  has_many :employees  
  validates :name, length: { minimum: 3 }
  validates :annual_revenue, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  validate :must_carry_apparel

  before_destroy :check_for_employees

  def must_carry_apparel
    if !mens_apparel && !womens_apparel
      errors.add(:base, "Store must carry at least one of the men's or women's apparel")
    end
  end

  private

  def check_for_employees
    if employees.count > 1
      errors.add(:base, "Cannot delete store with more than one employee.")
      throw :abort
    end
  end
end
