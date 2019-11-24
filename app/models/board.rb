class Board < ApplicationRecord
  has_many :lists 
  belongs_to :user 

  def self.all_boards(user_id)
    Board.find_by_sql(
      "SELECT *
      FROM boards as b
      WHERE b.user_id = #{user_id}"
    )
  end 
end
