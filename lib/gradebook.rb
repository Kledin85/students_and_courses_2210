require './lib/student'
require './lib/course'
class Gradebook

  attr_reader :instructor,
              :courses

  def initialize(instructor)
    @instructor = instructor
    @courses    = []
  end

  def add_course(course)
    @courses << course
  end

  def students
    # require 'pry'; binding.pry
    @courses.map do |course|
      course.student_names
    end.flatten
  end

  def student_threshold
    
  end
end
