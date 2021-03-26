@students = []

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def print_menu
  puts "1. input the students"
  puts "2. Show the students"
  puts "9. exit"
end

def show_students
  print_header
  print_students_list
  print_footer
end

def process(menu_selection)
    case menu_selection
      when "1"
        input_Students
      when "2"
        show_students
      when "9"
        exit
      else
        puts "I don't know what you meant, please try again"
    end
end

def input_Students
  puts "Please enter the names, hobbies, country of birth and height of the students"
  puts "To finish, just hit return twice"
  month = ['january', 'february', 'march', 'april', 'may', 'june', 'july',
  'august', 'september', 'octobar', 'november', 'december']
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
    puts "cohort?"
    cohort = gets.chomp
    while !month.include?(cohort) do
      if cohort.empty?
        cohort = 'november'
        break
      end
      puts "invalid month! please enter month again"
      cohort = gets.chomp
    end
  # add the student hash to the array
    @students << {
      name: name,
      hobbies: hobbies,
      country_of_birth: country_of_birth,
      height: height,
      cohort: cohort.to_sym
    }
    if @students.count == 1 
      puts "Now we have #{@students.count} student"
    else
      puts "Now we have #{@students.count} students"
    end
    # get another name from the user
    puts "name?"
    name = gets.chomp
  end
end

def print_header
  puts "The students of Villains Academy".center(115, "`")
  puts "-------------".center(115)
end

def print_students_list
  if !@students.empty?
    counter = 0
    while counter < @students.length do
      puts "#{@students[counter][:name]}, Hobbies:#{@students[counter][:hobbies]}, Country of birth:#{@students[counter][:country_of_birth]}, Height:#{@students[counter][:height]} (#{@students[counter][:cohort]} cohort)".center(115)
      counter += 1
    end
  else
    puts "there are no students".center(115)
  end
end

def print_footer
  if @students.empty?
  elsif @students.count == 1
    puts "Overall, we have #{@students.count} great student".center(115, "`")
  elsif
    puts "Overall, we have #{@students.count} great students".center(115, "`")
  end
end

def print_by_cohort(students)
  return if students.empty?
  cohorts_list = students.map { |student| student[:cohort] }
  puts "there are following cohorts"
  puts cohorts_list.uniq
  puts "Which cohort do you want to print?"
  cohort_to_print = gets.chomp.to_sym
  students.each do |student|
    if student[:cohort] == cohort_to_print
      puts "#{student[:name]}, Hobbies:#{student[:hobbies]}, Country of birth:#{student[:country_of_birth]}, Height:#{student[:height]}".center(115)
    end
  end
end

interactive_menu