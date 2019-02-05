class Student
  attr_accessor :first_name

  @@all_students = []

  def initialize(first_name)
    @first_name = first_name
  end

  def self.all
    @@all_students
  end

  def add_boating_test(test_name, test_status, instructor)
    BoatingTest.new(self, test_name, test_status, instructor)
  end

  def self.find_student(first_name)
    self.all.find { |student| student.first_name == first_name }
  end

  def grade_percentage
    passed_tests = BoatingTest.all.select { |test| test.student == self && test.status == "passed" }
                              .size
    all_tests = BoatingTest.all.select { |test| test.student == self }
                              .size
    passed_tests * 100.0 / all_tests
  end
end
