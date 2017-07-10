class CreateUrls < ActiveRecord::Migration[5.1]
  def change
    create_table :urls do |t|
      t.string :original_url
      t.string :new_url

      t.timestamps
    end
  end
end
