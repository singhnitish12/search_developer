class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable

  PROFILE_TITLE = [
    'Senior ROR developer',
    'Full Stack ROR developer',
    'Senior Full Stack ROR developer',
    'Junior Full Stack ROR developer',
    'Senior JAVA developer',
    'Senior Front End developer'
  ].freeze #use freeze method so that it can not be added(edited) dynamically

  def name
    "#{first_name} #{last_name}".strip #this strip method will remove all the blank spaces from left and right. 
  end

  def address
    "#{city}, #{state}, #{country}, #{pincode}"
  end

  def self.ransackable_attributes(auth_object = nil)
    ['country', 'city']
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end

end
