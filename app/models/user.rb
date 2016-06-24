class User < ActiveRecord::Base
  EMAIL_REGEXP = /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/


  # Validations
  validates :email,      presence: true, uniqueness: true,
                         format: {
                            with: EMAIL_REGEXP,
                            message: "Invalid email address."
                         }
  validates :first_name,            presence: true
  validates :last_name,             presence: true
  validates :password,              presence: true,  length: { minimum: 6 }
  validates :password_confirmation, presence: true

  # Filters
  before_save { |user| user.email = email.downcase }

  # Relations
  has_many :user_roles
  has_many :roles, :through => :user_roles

  # Methods
  has_secure_password

  def role_symbols
    self.roles.map do |role|
      role.name.underscore.to_sym
    end
  end
end
