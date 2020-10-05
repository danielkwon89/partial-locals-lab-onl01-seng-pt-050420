# == Schema Information
#
# Table name: students
#
#  id         :integer          not null, primary key
#  name       :string
#  hometown   :string
#  birthday   :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Student < ActiveRecord::Base
  has_many :classroom_students
  has_many :classrooms, through: :classroom_students

  def self.search(search_parameter)
    search_parameter == "" ? Student.all : Student.where("name LIKE ?", "%#{search_parameter}%")
    # binding.pry
    # if search_parameter == ""
    #   Student.all
    # else
    #   Student.where("name LIKE ?", "%#{search_parameter}%")
    # end
  end
end
