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
	student_hash = {:name => student, :month => :october} 
	temp_array.push	student_hash	
end
student_list = temp_array

def input_students
	puts "Please enter the names of the students"
	puts "To finish, hit return twice"
	students = [] #create empty array
	name = gets.chomp
	while !name.empty? do
		students << {:name => name, :month => :october}
		puts "Now we have #{students.length} students"
		name = gets.chomp
	end
	return students
end


def header
	puts "These are the students in Makers Academy"
	40.times { print '-'}
	puts	
end

def show_names(name_array)
	name_array.each {|student_hash| print student_hash[:name]," , ", student_hash[:month]; puts}
end

def show_footer(name_array)
	puts "Overall we have #{name_array.size} great students"
end

students = input_students
header
show_names(students)
show_footer(students)
