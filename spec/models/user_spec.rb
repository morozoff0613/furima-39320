require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it "nicknameとemail、passwordとpassword_confirmation、birthday、last_name、first_name、last_name_kana、first_name_kana、birthdayが存在すれば登録できる" do
        
        @user.nickname = 'テストユーザー'
        @user.email = 'test@example.com'
        @user.password = 'Password123'
        @user.password_confirmation = 'Password123'
        @user.birthday = Date.new(1990, 1, 1)
        @user.last_name = '山田'
        @user.first_name = '太郎'
        @user.last_name_kana = 'ヤマダ'
        @user.first_name_kana = 'タロウ'
        
        expect(@user).to be_valid
      end
    end
    context '新規登録できない場合' do
      it "nicknameが空では登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "passwordが空では登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが5文字以下では登録できない' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
  
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")  
      end

      it '英字のみのパスワードでは登録できない' do
        @user.password = 'password'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は英字と数字の両方を含む必要があります')
      end

      it '数字のみのパスワードでは登録できない' do
        @user.password = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は英字と数字の両方を含む必要があります')
      end

      it '全角文字を含むパスワードでは登録できない' do
        @user.password = 'パスワード123'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      
      it '重複したメールアドレスは登録できない'do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end


      it "birthdayが空では登録できない" do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end

      it "last_nameが空では登録できない" do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it '姓（全角）に半角文字が含まれていると登録できない' do
        @user.last_name = 'Yamada1'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name は全角日本語で入力してください')
      end

      it "first_nameが空では登録できない" do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it '名（全角）に半角文字が含まれていると登録できない' do
        @user.first_name = 'Taro2'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name は全角日本語で入力してください')
      end

      it "last_name_kanaが空では登録できない" do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end

      it '姓（カナ）にカタカナ以外の文字が含まれていると登録できない' do
        @user.last_name_kana = '山田123'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana は全角カタカナで入力してください')
      end

      it "first_name_kanaが空では登録できない" do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end

      it '名（カナ）にカタカナ以外の文字が含まれていると登録できない' do
        @user.first_name_kana = '太郎abc'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana は全角カタカナで入力してください')
      end
     
    end
  end
end