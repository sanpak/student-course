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
    @courses.each do |course|
      @courses[-1].students << self
    end
  end

  def courses
    @courses
  end

  def course_load
    @hash = Hash.new
    @hash[@courses.department] = @courses.credits
    @hash
  end
end
