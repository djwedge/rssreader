class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :title
      t.text :summary
      t.datetime :date
      t.boolean :status
      t.string :url
      t.integer :rssfeed_id

      t.timestamps
    end
  end
end
