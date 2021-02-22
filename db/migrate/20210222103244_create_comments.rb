class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.integer :comment_id
      t.string :body
      t.integer :author_id
      t.boolean :removed
      t.references :post, foreign_key: true

      t.timestamps
    end
  end
end
