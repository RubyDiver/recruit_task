class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :post_id
      t.string :title
      t.text :body
      t.datetime :published_at

      t.timestamps
    end
  end
end
