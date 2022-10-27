require './lib/student'
require './lib/course'
require './lib/gradebook'

RSpec.describe Gradebook do

  it "is a Gradebook" do
    gradebook = Gradebook.new("Puff")

    expect(gradebook).to be_a(Gradebook)
  end

  it "has an instructor" do
    gradebook = Gradebook.new("Puff")

    expect(gradebook.instructor).to eq("Puff")
  end

  it "has courses" do
    gradebook = Gradebook.new("Puff")
    course = Course.new("calculus", 2)
    gradebook.add_course(course)

    expect(gradebook.courses).to eq([course])
  end

  it "can have multiple courses" do
    gradebook = Gradebook.new("Puff")
    course1 = Course.new("calculus", 2)
    course2 = Course.new("biology", 2)
    gradebook.add_course(course1)
    gradebook.add_course(course2)

    expect(gradebook.courses).to eq([course1, course2])
  end

  it "can list all students" do
    gradebook = Gradebook.new("Puff")
    course1 = Course.new("calculus", 2)
    course2 = Course.new("biology", 2)
    student1 = Student.new({name: "Morgan", age: 21})
    student2 = Student.new({name: "John", age: 23})
    student3 = Student.new({name: "Wes", age: 23})
    student4 = Student.new({name: "Jane", age: 20})
    course1.enroll(student1)
    course1.enroll(student2)
    course2.enroll(student3)
    course2.enroll(student4)
    gradebook.add_course(course1)
    gradebook.add_course(course2)

    expect(gradebook.students).to eq(["Morgan", "John", "Wes", "Jane"])
  end

  xit "can see students below a threshold" do
    gradebook = Gradebook.new("Puff")
    course1 = Course.new("calculus", 2)
    course2 = Course.new("biology", 2)
    student1 = Student.new({name: "Morgan", age: 21})
    student2 = Student.new({name: "John", age: 23})
    student3 = Student.new({name: "Wes", age: 23})
    student4 = Student.new({name: "Jane", age: 20})
    course1.enroll(student1)
    course1.enroll(student2)
    course2.enroll(student3)
    course2.enroll(student4)
    gradebook.add_course(course1)
    gradebook.add_course(course2)
    student1.log_score(97.5)
    student1.log_score(90)
    student2.log_score(54.4)
    student2.log_score(65)

    expect(gradebook.student_threshold).to eq(student2)
  end
end
