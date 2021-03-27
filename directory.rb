@students = []

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def print_menu
  puts "1. input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. load the list from students.csv"
  puts "9. exit"
end

def process(menu_selection)
  case menu_selection
    when "1"
      input_Students
    when "2"
      show_students
    when "3"
      save_students
    when "4"
      load_students
    when "9" # 9 because we'll be adding more items  
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
  @name = STDIN.gets.chomp
  # while the name is not empty, repeat this code
  while !@name.empty? do
    puts "hobbies?"
    @hobbies = STDIN.gets.chomp
    puts "country of birth?"
    @country_of_birth = STDIN.gets.chomp
    puts "height?"
    @height = STDIN.gets.chomp
    puts "cohort?"
    @cohort = STDIN.gets.chomp

    while !month.include?(@cohort) do
      if @cohort.empty?
        @cohort = 'november'
        break
      end
      puts "invalid month! please enter month again"
      @cohort = STDIN.gets.chomp
    end

    input_hash
    puts "Now we have #{@students.count} student" if @students.count == 1
    puts "Now we have #{@students.count} students" if @students.count > 1
    puts "name?" #get aother name from the user
    @name = STDIN.gets.chomp
  end
end

def show_students
  print_header
  print_students_list
  print_footer
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
  return if @students.empty?
  puts "Overall, we have #{@students.count} great student".center(115, "`") if @students.count == 1
  puts "Overall, we have #{@students.count} great students".center(115, "`") if @students.count > 1
end

def save_students
  #open the file for writing
  file = File.open("students.csv", "w")
  #iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:hobbies], student[:country_of_birth], student[:height], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    @name, @hobbies, @country_of_birth, @height, @cohort = line.chomp.split(",")
    input_hash
  end
  file.close
end

def try_load_students
  filename = ARGV.first# first argument from the command line
  filename = "students.csv" if filename.nil? # if no filename is given then default to students.csv
  if File.exists?(filename) # if it exists
    load_students(filename)
     puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end

def input_hash
  @students << {name: @name, hobbies: @hobbies, country_of_birth: @country_of_birth, height: @height, cohort: @cohort.to_sym}
end

def print_by_cohort
  return if @students.empty?
  cohorts_list = @students.map { |student| student[:cohort] }
  puts "there are following cohorts"
  puts cohorts_list.uniq
  puts "Which cohort do you want to print?"
  cohort_to_print = STDIN.gets.chomp.to_sym
  @students.each do |student|
    puts "#{student[:name]}, Hobbies:#{student[:hobbies]}, Country of birth:#{student[:country_of_birth]}, Height:#{student[:height]}".center(115) if student[:cohort] == cohort_to_print
  end
end

try_load_students
interactive_menu