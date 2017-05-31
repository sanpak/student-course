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
    conflicts = @courses.select { |course| new_course.conflicts_with?(course) }
    if conflicts.empty?
      @courses << new_course unless @courses.include?(new_course)
      @courses[-1].students << self
    else
      raise "already enrolled"
    end
  end

  def courses
    @courses
  end

  def course_load
    @hash = Hash.new(0)
    (0...@courses.length).each do |idx|
      @hash[@courses[idx].department] += @courses[idx].credits
    end
    @hash
  end
end
