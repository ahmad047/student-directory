def input_Students
  puts "Please enter the names, hobbies, country of birth and height of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  month = ['january', 'february', 'march', 'april', 'may', 'june', 'july',
  'august', 'september', 'octobar', 'november', 'december']
  # get the details
  puts "name?"
  name = gets.gsub("\n", "")
  # while the name is not empty, repeat this code
  while !name.empty? do
    puts "hobbies?"
    hobbies = gets.gsub("\n", "")
    puts "country of birth?"
    country_of_birth = gets.gsub("\n", "")
    puts "height?"
    height = gets.gsub("\n", "")
    puts "cohort?"
    cohort = gets.gsub("\n", "")
    while !month.include?(cohort) do
      if cohort.empty?
        cohort = 'november'
        break
      end
      puts "invalid month! please enter month again"
      cohort = gets.gsub("\n", "")
    end
  # add the student hash to the array
    students << {
      name: name,
      hobbies: hobbies,
      country_of_birth: country_of_birth,
      height: height,
      cohort: cohort.to_sym
    }
    if students.count == 1 
      puts "Now we have #{students.count} student"
    else
      puts "Now we have #{students.count} students"
    end
    # get another name from the user
    puts "name?"
    name = gets.gsub("\n", "")
  end
  #return the array of students
  students
end
def print_header
  puts "The students of Villains Academy".center(115, "`")
  puts "-------------".center(115)
end
def print(students)
  counter = 0
  while counter < students.length do
    puts "#{students[counter][:name]}, Hobbies:#{students[counter][:hobbies]}, Country of birth:#{students[counter][:country_of_birth]}, Height:#{students[counter][:height]} (#{students[counter][:cohort]} cohort)".center(115)
    counter += 1
  end
end
def print_by_cohort(students)
  cohorts_list = students.map { |student| student[:cohort] }
  puts "there are following cohorts"
  puts cohorts_list.uniq
  puts "Which cohort do you want to print?"
  cohort_to_print = gets.gsub("\n", "").to_sym
  students.each do |student|
    if student[:cohort] == cohort_to_print
      puts "#{student[:name]}, Hobbies:#{student[:hobbies]}, Country of birth:#{student[:country_of_birth]}, Height:#{student[:height]}".center(115)
    end
  end
end
def print_footer(names)
  if names.count == 1
    puts "Overall, we have #{names.count} great student".center(115, "`")
  else
    puts "Overall, we have #{names.count} great students".center(115, "`")
  end
end
# nothing happens untill we call the methods
students = input_Students
print_header
print(students)
print_footer(students)
print_by_cohort(students)