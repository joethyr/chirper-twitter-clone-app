class AddUserToChirps < ActiveRecord::Migration[7.0]
  def change
    add_reference :chirps, :user, foreign_key: true
  end
end
