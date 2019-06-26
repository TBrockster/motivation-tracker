require 'motivation_tracker'

describe MotivationTracker do
  it { is_expected.to respond_to(:motiv_tracker) }
  it { is_expected.to respond_to(:show_motiv) }
  it { is_expected.to respond_to(:avg_motiv) }
  it 'Expected to return message' do
    mmt = MotivationTracker.new
    expect(mmt.motiv_tracker(5)). to eq 'Motivation Stored!'
  end
  it 'Expected to return previously input Motivation Score' do
    mmt = MotivationTracker.new
    mmt.motiv_tracker(5)
    expect(mmt.show_motiv). to eq [5]
  end
end
