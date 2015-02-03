#setup student array

def input_students
	puts "Please enter the names , cohorts of the students"
	puts "To finish, type quit"
	students = [] #create empty array
	input_array = STDIN.gets.chomp.split(',')

	until input_array.first.nil? do
		name = input_array.first
		if input_array.length > 1
			month = input_array.last.strip.to_sym
		else
			month = :october # default
		end
		students << {:name => name, :cohort => month}
		plural = students.length == 1 ? '' : 's'
		puts "Now we have #{students.length} student#{plural}"
		input_array = STDIN.gets.chomp.split(',')
	end
	return students
end

def header
	puts "These are the students in Makers Academy"
	40.times { print '-'}
	puts	
end

def show_names
	puts 'no names' unless @students.any? 
	@students.each_with_index do |student_hash, index| 
		print (index.to_s + " " + student_hash[:name].rjust(33-index.to_s.size) + " , "+ student_hash[:cohort].to_s)
		puts
	end
end


def interactive_menu
	loop do
		print_menu
	  process ( STDIN.gets.chomp ) # process selection
	end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save to 'students.csv'"
  puts "4. Load students"
  puts "9. Exit" # 9 because we'll be adding more items  
end

def show_students
	header
  show_names
  show_footer
end

def process (selection)
		case selection
	  when '1' 
	  	#@students.push input_students
	  	@students = input_students
	  when '2' 
	  	show_students
	  when'3'
	  	save_students
	  when '4'
	  	load_students
	  when '9' 
	  	exit
	  else
	  	puts "I don't know what you mean"
	  end
end


def save_students
	#open file for writing
	file = File.open("students.csv","w")
	#iterate over students
	@students.each do |student|
		student_data = [student[:name], student[:cohort]] # problem here
		csv_line =  student_data.join(",")
		file.puts csv_line
	end
	file.close
end
	
def load_students(filename = "students.csv")
	file = File.open(filename,"r")
	file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    @students.push ({ :name => name, :cohort => cohort.to_sym })
	end
	file.close
end

def try_load_students
	filename = ARGV.first
	return if filename.nil? # no filename supplied as arg
	if File.exists?(filename)
		load_students(filename)
	else
		puts "sorry, #{filename} not found"
		exit # quit program
	end
end

@students = []
try_load_students
loop do
	interactive_menu
end





