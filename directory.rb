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
		show_header
		show_names
		show_footer
		puts ''
	end	


	def show_names
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

  def save_students(filename = 'students.csv')
		File.open(filename,"w") do |file|
			@students.each do |student| 
		    csv_line = [student.name,student.cohort.to_s].join(',')
				file.puts csv_line
			end  	
	  end
	end

  def load_students(filename = 'students.csv')
		File.open(filename,"r") do |file|
			file.readlines.each do |line| 
				name, cohort = line.chomp.split(',')
				puts name, cohort
		    @students << (Student.new(name, cohort) )
			end  	
  	end
  end

end

class Menu 
	def initialize (items = ["Input students","Show students","Save","Load","Exit"])
		@menu = items
	end

	def print
		@menu.each_with_index {|label,index| puts "#{index}. #{label}" }
	end

  def choose (index)
  	return @menu[index.to_i]
  end
  	  
end

makers = School.new("Makers academy")
makers.load_students('test_data.csv')

makers.show_students


my_menu = Menu.new
my_menu.print
puts "enter choice"
case my_menu.choose (STDIN.gets)
	when "Input students"
		puts "Add code to input students"
	when "Show students"
		puts "Add code to show students"
	when "Load"
		makers.load_students
	when "Save"
		makers.save_students
	end
