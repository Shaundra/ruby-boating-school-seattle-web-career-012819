class Instructor
  attr_accessor
  @@all_instructors = []

  def initialize(name)
    @name = name
  end

  def self.all
    @@all_instructors
  end

  # any Instructor can update the status of any Student's tests
  def pass_student(student, name)
    passing_test = BoatingTest.find_test_by_name(name, student)

    if passing_test
      passing_test.test_status = 'passed'
      passing_test
    else
      BoatingTest.new(student, name, "passed", self)
    end
  end

  def fail_student(student, name)
    failing_test = BoatingTest.find_test_by_name(name, student)

    if failing_test
      failing_test.test_status = 'failed'
      failing_test
    else
      BoatingTest.new(student, name, "failed", self)
    end
  end
end
