# Portfolio App

This simple Ruby on Rails application allows you to manage a portfolio of stocks, calculate profits, and annualized returns.

## Models

### Stock
- **Attributes**:
  - `price(date)`: Returns the price of the stock on a specific date.
  
### Portfolio
- **Attributes**:
  - `profit(start_date, end_date)`: Calculates the profit of the portfolio between two dates.
  - `annualized_return(start_date, end_date)`: Calculates the annualized return of the portfolio between two dates.

## Formulas Used

### Profit
The profit is calculated by subtracting the initial value from the final value. 

- The **initial value** is the total amount of money represented by the stocks in the portfolio on the start date. This is calculated by multiplying the price of each stock by the quantity owned on that date and summing these amounts for all stocks.
  
- The **final value** is the total amount of money represented by the stocks in the portfolio on the end date. This is calculated in the same way as the initial value, using the stock prices on the end date.

### Annualized Return
The annualized return is calculated by taking the total profit and dividing it by the initial value to find the profit percentage. This value is then adjusted to reflect an annualized rate based on the number of days between the start and end dates. 

- First, you find the profit percentage by dividing the total profit by the initial value. 

- Then, this percentage is adjusted for the period of time the investment was held, converting it to an annualized figure. This adjustment considers how long the investment was held, effectively scaling the return to a yearly basis.

### Price
The `price(date)` method returns the price of the stock on a specific date. In this implementation, it can simulate a random price.

## Seeds for Testing

To test the application, you can use the following seeds. These will create a portfolio and some associated stocks.

```ruby
# db/seeds.rb
Portfolio.create(name: "My Portfolio")

10.times do |i|
  Stock.create(
    name: "Stock #{i + 1}",
    quantity: rand(1..20),
    portfolio: Portfolio.first
  )
end

How to Test the Application

- Clone the repository.

- Run bundle install to install dependencies.

- Run 'rails db:create' to create the database.

- Run 'rails db:migrate' to create the tables.

- Run 'rails db:seed' to create test data.

- Use the Rails console to interact with the models and test the methods 'rails console'

Inside the console, you can test the following commands

- portfolio = Portfolio.first
- start_date = Date.parse("2023-08-01")
- end_date = Date.parse("2023-08-31")

- puts "Profit: #{portfolio.profit(start_date, end_date)}"
- puts "Annualized Return: #{portfolio.annualized_return(start_date, end_date)}"
