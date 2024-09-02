# app/models/stock.rb
class Stock < ApplicationRecord
  belongs_to :portfolio
  has_many :prices

  validates :name, presence: true
  validates :name, uniqueness: { scope: :portfolio_id, message: "should be unique within a portfolio" }
  validates :quantity, numericality: { only_integer: true, greater_than: 0 }

  def price(date)
    prices.find_by(date: date)&.value.to_f || 0.0
  end
end
