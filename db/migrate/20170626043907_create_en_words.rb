class CreateEnWords < ActiveRecord::Migration
  def change
    create_table :en_words do |t|
      t.text :name
      t.text :meaning
      t.text :number
      t.text :grade

      t.timestamps null: false
    end
  end
end
