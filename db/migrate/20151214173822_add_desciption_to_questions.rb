class AddDesciptionToQuestions < ActiveRecord::Migration
  def up
    add_column :questions, :description, :text, null: false
  end

  def down
    remove_column :questions, :description 
  end
end
