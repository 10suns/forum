class Student < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :validatable
  belongs_to :course
  has_many :student_subjects, dependent: :destroy
  has_many :subjects, through: :student_subjects
end
