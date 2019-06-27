require 'pry'
require 'csv'

class MotivationTracker
  def input_motivation(num)
    File.write('motivation_store.csv', num)
    # CSV.open('motivation_store.csv', 'w') do |y|
    #   y << num.to_s
    # end
    p 'Motivation Stored!'
  end

  def show_motivation
  end

  def average_motivation
    average = 0.0
    motivation.each { |motivation_score| average += motivation_score}
    average /= motivation.length
    average.round(1)
  end
end

# binding.pry
