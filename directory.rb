def input_Students
  puts "Please enter the names, hobbies, country of birth and height of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the details
  puts "name?"
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    puts "hobbies?"
    hobbies = gets.chomp
    puts "country of birth?"
    country_of_birth = gets.chomp
    puts "height?"
    height = gets.chomp
  # add the student hash to the array
    students << {
      name: name,
      hobbies: hobbies,
      country_of_birth: country_of_birth,
      height: height,
      cohort: :november
    }
    puts "Now we have #{students.count} students"
    # get another name from the user
    puts "name?"
    name = gets.chomp
  end
  #return the array of students
  students
end
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end
def print(students)
  counter = 0
  while counter < students.length do
    puts "#{students[counter][:name]}, Hobbies:#{students[counter][:hobbies]}, Country of birth:#{students[counter][:country_of_birth]}, Height:#{students[counter][:height]} (#{students[counter][:cohort]} cohort)"
    counter += 1
  end
end
def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end
# nothing happens untill we call the methods
students = input_Students
print_header
print(students)
print_footer(students)