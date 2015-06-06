class User < ActiveRecord::Base
  has_secure_password
  before_create :give_token

  def User.digest(string)
    Digest::SHA1.hexdigest(string)
  end

  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    token = User.new_token
    self.remember_me = User.digest(token)
  end

  private
    def give_token
      self.remember
    end
end
