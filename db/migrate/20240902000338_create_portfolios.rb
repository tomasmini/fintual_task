class CreatePortfolios < ActiveRecord::Migration[7.2]
  def change
    create_table :portfolios do |t|
      t.timestamps
    end
  end
end
