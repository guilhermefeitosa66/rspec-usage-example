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
end