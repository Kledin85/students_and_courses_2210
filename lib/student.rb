class Student

  attr_reader :name,
              :age,
              :scores

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @age = attributes.fetch(:age)
    @scores = []
  end

  def log_score(num)
    @scores << num
  end

  def grade
    @scores.sum.to_f / @scores.length
  end
end
