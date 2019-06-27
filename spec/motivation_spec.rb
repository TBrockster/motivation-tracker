require 'motivation_tracker'

describe MotivationTracker do
  it { is_expected.to respond_to(:input_motivation) }
  it { is_expected.to respond_to(:show_motivation) }
  it { is_expected.to respond_to(:average_motivation) }
  it 'Expected to return message' do
    my_motivation_tracker = MotivationTracker.new
    expect(my_motivation_tracker.input_motivation(5)). to eq 'Motivation Stored!'
  end
  it 'Expected to return previously input Motivation Score' do
    my_motivation_tracker = MotivationTracker.new
    my_motivation_tracker.input_motivation(5)
    expect(my_motivation_tracker.show_motivation). to eq [5]
  end
  it 'Expected to return an array of previously input Motivation Scores' do
    my_motivation_tracker = MotivationTracker.new
    my_motivation_tracker.input_motivation(5)
    my_motivation_tracker.input_motivation(9)
    expect(my_motivation_tracker.show_motivation). to eq [5, 9]
  end
  it 'Expected to return avg motivation' do
    my_motivation_tracker = MotivationTracker.new
    my_motivation_tracker.input_motivation(5)
    my_motivation_tracker.input_motivation(9)
    expect(my_motivation_tracker.average_motivation). to eq 7
    my_motivation_tracker.input_motivation(5)
    expect(my_motivation_tracker.average_motivation). to eq 6.3
  end
  it 'Expect to create motivation_store.csv' do
    my_motivation_tracker = MotivationTracker.new
    my_motivation_tracker.input_motivation(5)
    expect(Pathname('./motivation_store.csv').exist?). to eq true
  end
  it 'Expect motivation_store.csv to contain motivation scores' do
    my_motivation_tracker = MotivationTracker.new
    my_motivation_tracker.input_motivation(1)
    my_motivation_tracker.input_motivation(2)
    contents_string = CSV.read('motivation_store.csv').flatten
    contents_int = contents_string.map(&:to_i)
    expect(contents_int). to eq [1, 2]
  end
  it 'Expect show motivations to take from stored file' do
  my_motivation_tracker = MotivationTracker.new
  my_motivation_tracker.input_motivation(7)
  my_motivation_tracker.input_motivation(5)
  my_motivation_tracker.input_motivation(5)
  my_motivation_tracker.input_motivation(10)
  contents_string = CSV.read('motivation_store.csv').flatten
  contents_int = contents_string.map(&:to_i)
  expect(my_motivation_trackershow_motivation). to eq contents_int
  end
end
