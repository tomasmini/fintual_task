# app/models/portfolio.rb
class Portfolio < ApplicationRecord
  has_many :stocks

  def profit(start_date, end_date)
    start_value = stocks.sum { |stock| stock.price(start_date) * stock.quantity }
    end_value = stocks.sum { |stock| stock.price(end_date) * stock.quantity }
    (end_value - start_value).to_f
  end

  def annualized_return(start_date, end_date)
    total_profit = profit(start_date, end_date)
    num_days = (end_date - start_date).to_f
    start_value = stocks.sum { |stock| stock.price(start_date) * stock.quantity }
    
    annualized_return = (1 + total_profit / start_value)**(365 / num_days) - 1
    
    (annualized_return * 100).to_f / 10
  end
end
