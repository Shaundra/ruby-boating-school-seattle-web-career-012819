class BoatingTest
  attr_accessor :test_name, :test_status, :student, :instructor

  @@all_boating_tests = []

  # BoatingTests are initialized w a Student obj, test name and status strings, and an Instructor obj
  def initialize(student, test_name, test_status, instructor)
    @student = student
    @test_name = test_name
    @test_status = test_status
    @instructor = instructor

    @@all_boating_tests << self
  end

  def self.all
    @@all_boating_tests
  end

  def self.find_test_by_name(name, student)
    self.all.find { |test| test.test_name == name && test.student == student }
  end
end
