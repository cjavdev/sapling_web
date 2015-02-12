class User < ActiveRecord::Base
  validates :email, :session_token, :password_digest, presence: true
  validates :password, length: { minimum: 6, allow_nil: true }
  validates :email, uniqueness: true
  attr_reader :password

  before_validation do
    self.session_token ||= SecureRandom.hex
  end

  def password=(raw)
    @password = raw

    self.password_digest = BCrypt::Password.create(raw)
  end

  def is_password?(raw)
    BCrypt::Password.new(password_digest).is_password?(raw)
  end

  def self.find_by_params(user_params)
    user = User.find_by(email: user_params[:email])
    return user if user && user.is_password?(user_params[:password])

    nil
  end

  def reset_session_token!
    self.session_token = SecureRandom.hex
    save!
    session_token
  end
end
