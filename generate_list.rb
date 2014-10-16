raw_student_list = []

raw_file = File.new("student_data2.txt")
while (line = raw_file.gets)
	line.chomp
	student = line.split(/\n/)
	raw_student_list.push  student.first.strip
end

student_list = raw_student_list.uniq

puts "students are (count  = #{student_list.size}"
student_list.each do |student| puts "puts '#{student}'" end
	