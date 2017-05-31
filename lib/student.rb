require_relative 'course'

class Student
  attr_accessor :first_name, :last_name
  def initialize(first_name,last_name)
    @courses = []
    @first_name = first_name
    @last_name = last_name
  end

  def name
    "#{@first_name} #{@last_name}"
  end

  def enroll(new_course)
    @courses << new_course
    @courses[-1].students << self
  end

  def courses
    @courses
  end

  def course_load
    @hash = Hash.new

  end
end
