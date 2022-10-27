class Course

  attr_reader :name,
              :capacity,
              :students

  def initialize(name, capacity)
    @name     = name
    @capacity = capacity
    @students = []
  end

  def full?
    @students.length == capacity
  end

  def enroll(student)
    @students << student
  end

  def student_names
    @students.map do |student|
      student.name
    end
  end

  def student_scores
    @students.map do |student|
      student.score
    end
  end
end
