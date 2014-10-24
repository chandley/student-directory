#setup student array

student_list = [
'Abdul Hassan',
'Alan Bridger',
'alex blease',
'Alexander Levin',
'Ana Nogal',
'Andrew Harrison',
'Andrew Hercules',
'Andrew Snead',
'Anna Jerofejeva',
'Attila Mirk',
'Ayo Obembe',
'Ben Hutchinson',
'Bernard Mordan',
'Camilla van Klinken',
'chris handley',
'Christopher Batts',
'Clare Trembath',
'Claudia B',
'Colin Smif',
'Contra Mundi',
'Craig Horsborough',
'Dale Stevens',
#'Dan Le Dosquet-Bergquist',
'Daniel Cutler',
'Daniel Le Dosquet - Bergquist',
'Denise Yu',
'Edward Byne',
'Elena Garrone',
'Ella Schofield',
#'Enrique Comba Riepenhausen',
'Evgeny Shadchnev',
'Fad Fad',
'Giorgia Amici',
'Hadi Chalabi',
'Izzy Markwick',
'James Carter',
'JANA SANCHEZ',
'Jay Dalu-Chandu',
'John Kiely',
'Johnny Lakin',
#'Jordan Maker',
'Karin Nielsen',
'Margherita Serino',
'Ming Chan',
'Mishal I',
'Nick Dyer',
'Nicole Pellicena',
'Nikesh Ashar',
#'Owner',
'Pavel Redics',
'Rachel Nolan',
'Rich Lake',
'Sam Joseph',
'Sandrine Zhang-Ferron',
'Sean Stevens',
'Shan Hasan',
'Simon Lange',
'Stephen Giles',
'Tim Scully',
'Victoria Stepanovna',
'Yvette Cook',
'Zeeshan Rasool'
]
temp_array = []
student_list.each do |student| 
	student_hash = {:name => student, :cohort => :october} 
	temp_array.push	student_hash	
end
students = temp_array

def input_students
	puts "Please enter the names , cohorts of the students"
	puts "To finish, type quit"
	students = [] #create empty array
	input_array = gets.chomp.split(',')

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
		input_array = gets.chomp.split(',')
	end
	return students
end


def header
	puts "These are the students in Makers Academy"
	40.times { print '-'}
	puts	
end

def show_names
	@students.each_with_index do |student_hash, index| 
		print (index.to_s + " " + student_hash[:name].rjust(33-index.to_s.size) + " , "+ student_hash[:cohort].to_s)
		puts
	end
end
def show_footer
	puts "Overall we have #{@students.size} great students"
end

def interactive_menu
	loop do
		print_menu
	  process ( gets.chomp ) # process selection
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
	
def load_students
	file = File.open("students.csv","r")
	file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    @students << { :name => name, :cohort => cohort.to_sym }
	end
	file.close
end



loop do
	interactive_menu
end





