require 'pry'

class MotivationTracker
  attr_reader :show_motiv
  def initialize
    show_motiv = []
    @show_motiv = show_motiv
  end

  def motiv_tracker(num)
    @show_motiv << num
    p 'Motivation Stored!'
  end

  def avg_motiv; end
end

# binding.pry
