class CreateOpinions < ActiveRecord::Migration
  def change
    create_table :opinions do |t|
      t.string :title
      t.string :option1
      t.string :option2

      t.timestamps null: false
    end
  end
end
