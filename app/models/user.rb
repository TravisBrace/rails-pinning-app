class User < ActiveRecord::Base
  has_many :pinnings
  has_many :pins, through: :pinnings
  has_many :boards
  
  attr_accessor :password
  before_save :encrypt_password
  
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email
  
  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
  
  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end
  
  def followed
    Follower.where("follower_id=?", self.id).map{|f| f.user }
  end
  
  def not_followed
    User.all - self.followed - [self]
  end
  
end