describe 'Composition' do
    subject { 'Ruby on Rails' }
    it { is_expected.to start_with('Ruby').and end_with('Rails') }
    it { is_expected.to start_with('Python').or end_with('Rails') }
end