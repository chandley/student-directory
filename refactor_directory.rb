class Student
	attr_accessor :name, :cohort
	def initialize (name, cohort = :october)
		@name, @cohort = name, cohort.to_s.downcase.to_sym
	end
end

class School
	attr_accessor :students, :name
	def initialize (name)
		@name = name
		@students = []
	end

	def add_student (student)
		students.push student
	end

	def show_students
		puts 'no names' unless @students.any? 
	  @students.each_with_index do |student, index| 
			print (index.to_s + 
			       " " + 
			       student.name.rjust( 33 - index.to_s.size) + 
			       " , " + 
			       student.cohort.to_s
			       )
			puts
		end
	end

	def show_header
		puts "These are the students in #{@name}"
	  40.times { print '-'}
	  puts			
	end

	def show_footer
	  puts "Overall we have #{@students.size} great students"
  end

end

makers = School.new("Makers academy")
makers.add_student(Student.new("Mary Poppins"))
makers.add_student(Student.new("George Best", 'october'))

makers.show_students