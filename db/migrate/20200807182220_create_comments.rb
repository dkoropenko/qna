# frozen_string_literal: true

class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.belongs_to :user
      t.belongs_to :commentable, polymorphic: true

      t.text :body

      t.timestamps
    end
  end
end
