require 'calculator'

describe Calculator, ': A simple calculator class' do
    # subject(:calc) { described_class.new() }
    subject { Calculator.new() }
    
    context '#sum method with 2 args' do
        it 'a and b positive' do
            result = subject.sum(2, 3)

            expect(result).to eq(5)
        end
    
        it 'a and b negative' do
            result = subject.sum(-2, -3)
            expect(result).to eq(-5)
        end

        # use xit instead it to skip the test
        it 'a and b +/-' do
            result = subject.sum(2, -3)
            expect(result).to eq(-1)

            result = subject.sum(-2, 3)
            expect(result).to eq(1)
        end
    end
end