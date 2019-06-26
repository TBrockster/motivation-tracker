require 'pry'
require 'csv'

class MotivationTracker
  attr_reader :motivation
  def initialize
    motivation = []
    @motivation = motivation
  end

  def input_motivation(num)
    @motivation << num
    CSV.open('motivation_store.csv', 'w') do |y|
      y << @motivation
    end
    p 'Motivation Stored!'
  end

  # def save_students(filename = "students.csv")
  #   CSV.open(filename, "w") do |csv|
  #       @students.each do |student|
  #           csv << [student[:name], student[:cohort]]
  #       end
  #   end
  #   puts "File Saved"
  # end

  def average_motivation
    average = 0.0
    motivation.each { |motivation_score| average += motivation_score}
    average /= motivation.length
    average.round(1)
  end
end

# binding.pry
