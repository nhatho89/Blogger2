class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title #adds a title attribute to each article
      t.text :body # adds a body attribute

      t.timestamps null: false # adds a created_at and updated_at
    end
  end
end
