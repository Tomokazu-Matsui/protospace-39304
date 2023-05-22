class Comment < ApplicationRecord
  belongs_to :prototype # tweetsテーブルとのアソシエーション
  belongs_to :user  # usersテーブルとのアソシエーション
  validates :content, presence: true
  validates :prototype, presence: true
  validates :user, presence: true
  
end
