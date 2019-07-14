class CreateAnyFiles < ActiveRecord::Migration[5.2]
  def change
    create_table :any_files do |t|
      t.string :name, null: false
      t.text :url, null: false

      t.timestamps
    end
  end
end
