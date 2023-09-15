class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  validates :first_name, :last_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龠]+\z/,
    message: "は全角日本語で入力してください" }

  # 名字(カナ)と名前(カナ)が全角カタカナであることを検証する正規表現
  validates :first_name_kana, :last_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/,
    message: "は全角カタカナで入力してください" }

  # パスワードが英数字混合であることを検証する正規表現
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i,
    message: "は英字と数字の両方を含む必要があります" }
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :birthday, presence: true


end
