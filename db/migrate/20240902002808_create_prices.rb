class CreatePrices < ActiveRecord::Migration[7.2]
  def change
    create_table :prices do |t|
      t.date :date
      t.decimal :value
      t.references :stock, null: false, foreign_key: true

      t.timestamps
    end
  end
end
