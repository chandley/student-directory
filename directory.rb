class Student
	attr_accessor :name, :cohort
	def initialize (name, cohort = :october)
		@name, @cohort = name, cohort.to_s.downcase.to_sym
	end
end

class School
	attr_accessor :name
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
		    @students << (Student.new(name, cohort) )
			end  	
  	end
  end

  def add_students
  	puts "Please enter names, cohorts of students - empty line to exit"
  	input_array = STDIN.gets.chomp.split(',')
  	until input_array.first.nil? do
		  input_student = Student.new ( input_array.first )
		  input_student.cohort = input_array.last.to_sym if input_array.size > 1 # use default if nothing entered
		  @students << input_student
			plural = @students.length == 1 ? '' : 's'
			puts "Now we have #{@students.length} student#{plural}"
			input_array = STDIN.gets.chomp.split(',')
		end
  end

end

class Menu 
	def initialize (items = ["Input students","Show students","Save","Load","Exit"])
		@menu = items
	end

	def print
		@menu.each_with_index {|label,index| puts "#{index}. #{label}" }
		puts "Please enter choice"
	end

  def choose (index)
  	return @menu[index.to_i]	# return text corresponding to choice
  end
  	  
end

makers = School.new("Makers academy")
main_menu = Menu.new

loop do 
	main_menu.print
	  case main_menu.choose (STDIN.gets)
		when "Input students"
			makers.add_students
		when "Show students"
			makers.show_students
		when "Load"
			makers.load_students
		when "Save"
			makers.save_students
		when "Exit"
			exit
	end
end

