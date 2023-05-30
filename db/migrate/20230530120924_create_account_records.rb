class CreateAccountRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :account_records do |t|
      t.string :name
      t.decimal :amount
      t.references :author, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end