class AuthUser
  include ActiveModel::Model
  attr_accessor :email, :password, :user, :user_id

  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  validates :password, presence: true

  def login_succesful?
    if self.valid?
      self.user = User.find_by_email(self.email)
      self.user_id = self.user.id
      if self.user.nil?
        return false
      else
        if self.user.authenticate(self.password)
          return true
        end
      end
    end
    return false
  end


end
