require 'calculator'
require 'person'

# RSpec.describe 'Description' do
#    another way to use rspec
# end

describe 'Matchers' do
    context 'Equals matchers' do
        it '#equal - test if it is the same object' do
            a = 'ruby'
            b = 'ruby'
            expect(a).to equal(a)
            expect(a).not_to equal(b)
        end

        it '#be - test if it is the same object' do
            a = 'ruby'
            b = 'ruby'
            expect(a).to be(a)
            expect(a).not_to be(b)
        end

        it '#eql - test if it has the same value' do
            a = 'ruby'
            b = 'ruby'
            expect(a).to eql(b)
        end

        it '#eq - test if it has the same value' do
            a = 'ruby'
            b = 'ruby'
            expect(a).to eq(b)
        end

    end

    context 'True/False matchers' do
        it 'be true' do
            a = 1.odd?
            expect(a).to be(true)
        end

        it 'be false' do
            a = 1.even?
            expect(a).to be(false)
        end

        it 'be truethy' do
            a = 1.odd?
            expect(a).to be_truthy
        end

        it 'be falsey' do
            a = 1.even?
            expect(a).to be_falsey
        end

        it 'be nil' do
            x = nil
            expect(x).to be_nil
        end
    end

    context '>, >=, <, <= matchers' do
        it '>' do 
            expect(5).to be > 1 
        end

        it '>=' do 
            expect(5).to be >= 1
            expect(5).to be >= 5
        end

        it '<' do 
            expect(1).to be < 5 
        end

        it '<=' do 
            expect(1).to be <= 1 
            expect(1).to be <= 5 
        end
    end

    context 'be_between matchers' do
        it 'inclusive' do
            expect(2).to be_between(1, 5).inclusive
            expect(1).to be_between(1, 5).inclusive
            expect(5).to be_between(1, 5).inclusive
        end

        it 'exclusive' do
            expect(2).to be_between(1, 5).exclusive
            expect(1).not_to be_between(1, 5).exclusive
            expect(1).not_to be_between(1, 5).exclusive
        end
    end

    context 'regex matchers' do
        it 'match' do
            VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
            expect('guilherme@email.com').to match(VALID_EMAIL_REGEX)
        end
    end

    context 'start/end matchers' do
        it 'start_with' do
          expect('foo bar').to start_with('foo')
          expect([1, 2, 3]).to start_with(1)
        end

        it 'end_with' do
            expect('foo bar').to end_with('bar')
            expect([1, 2, 3]).to end_with(3)
        end
    end

    context 'Classes & Methods matchers' do
        it 'be_instance_of' do
            expect(5).to be_instance_of Integer
        end
        
        it 'be_kind_of' do
            expect(5).to be_kind_of Integer
            expect(5).to be_kind_of Numeric
            expect(5).to be_kind_of Object
        end
        
        it 'be_a / be_an' do
            expect(5).to be_an Integer
            expect(5).to be_a Numeric
            expect(5).to be_an Object
        end
        
        it 'respond_to' do
            expect(5).to respond_to(:times)
            expect(5).to respond_to(:to_s)
            expect('ruby').to respond_to(:size)
        end
    end

    context 'Classes attibutes matchers' do
        it 'have_attributes' do
            p = Person.new
            expect(p).to have_attributes(name: nil)

            p = Person.new('Guilherme', 31)
            expect(p).to have_attributes(name: 'Guilherme', age: 31)
        end
    end

    context 'Erros matchers' do
        it 'raise_error: should not divide by zero' do
            calc = Calculator.new
            expect{ calc.div(2, 0) }.to raise_error(ZeroDivisionError) # test from class error
            expect{ calc.div(2, 0) }.to raise_error("divided by 0") # test from message error
            expect{ calc.div(2, 0) }.to raise_error(ZeroDivisionError, "divided by 0") # test from both class and message error
            expect{ calc.div(2, 0) }.to raise_error(/divided/) # test from regex message error
        end
    end

    context Array.new([1, 2, 3, 4, 5]), 'Arrays matchers' do
        it 'include' do
            expect(subject).to include(2)
            expect(subject).to include(2, 3)
        end

        it 'match_array' do
            expect(subject).not_to match_array([1, 2])
            expect(subject).to match_array([1, 2, 3, 4, 5])
        end
        
        it 'contain_exactly' do
            expect(subject).not_to contain_exactly(1, 2)
            expect(subject).to contain_exactly(1, 2, 3, 4, 5)
        end
    end

    context (1..5), 'Ranges matchers' do
        it 'cover' do
            expect(subject).to cover(2)
            expect(subject).to cover(2, 5)
            expect(subject).not_to cover(0, 6)

            # an alternative to expect(subject).to
            is_expected.to cover(3)
        end

        # one line syntaxe
        it { is_expected.to cover(2) }
        it { is_expected.to cover(2, 5) }
        it { is_expected.not_to cover(0, 6) }
    end

    context [1, 2, 3, 4, 5], 'Collections matchers' do
        it { is_expected.to all(be > 0)}
    end

    context 'be_within matcher' do
        subject { 2.5 }
        # delta 0.5
        # |1.5|1.6|1.7|1.8|1.9| <= (2) => |2.1|2.2|2.3|2.4|2.5|
        it { is_expected.to be_within(0.5).of(2) }
    end

    context 'satisfy matcher' do
        it { expect(2).to satisfy { |x| x % 2 == 0 } }

        it do 
            expect(9).to satisfy('be a multiple of 3') do |x| 
                x % 3 == 0
            end
        end
    end
end