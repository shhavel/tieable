require "spec_helper"

describe Object do
  context 'receives some arguments' do
    context 'returns self if first argument is nil' do
      specify 'nil argument' do
        expect(subject.tie(nil)).to eq subject
      end

      specify 'nil and one more argument' do
        expect(subject.tie(nil, 'arg1')).to eq subject
      end

      specify 'nil and two more arguments' do
        expect(subject.tie(nil, 'arg1', 'arg2')).to eq subject
      end

      specify 'nil argument with block' do
        expect(subject.tie(nil) {|o| o.do_something } ).to eq subject
      end

      specify 'nil and two arguments with block' do
        expect(subject.tie(nil, 'arg1', 'arg2') {|o| o.do_something } ).to eq subject
      end
    end

    context 'acts like public_send if there is not-nil first argument' do
      let(:expected_result) { double('result returned from method be_cool') }
      let(:p) { proc {} }

      specify 'method name argument' do
        subject.should_receive(:be_cool).with().once.and_return(expected_result)
        subject.tie(:be_cool).should == expected_result
      end

      specify 'method name and one more argument' do
        subject.should_receive(:be_cool).with('arg1').once.and_return(expected_result)
        subject.tie(:be_cool, 'arg1').should == expected_result
      end

      specify 'method name and two more arguments' do
        subject.should_receive(:be_cool).with('arg1', 'arg2').once.and_return(expected_result)
        subject.tie(:be_cool, 'arg1', 'arg2').should == expected_result
      end

      specify 'method name with block' do
        subject.should_receive(:be_cool).and_yield(&p).once.and_return(expected_result)
        subject.tie(:be_cool, &p).should == expected_result
      end

      specify 'method name and two more arguments with block' do
        subject.should_receive(:be_cool).with('arg1', 'arg2').and_yield(&p).once.and_return(expected_result)
        subject.tie(:be_cool, 'arg1', 'arg2', &p).should == expected_result
      end

      it 'indeed uses public_send' do
        subject.should_receive(:public_send).with(:be_cool, 'arg1').once.and_return(expected_result)
        subject.tie(:be_cool, 'arg1').should == expected_result
      end
    end
  end

  context 'only block given (no arguments)' do
    let(:p) { proc {|o| 'result returned from calling block on self' } }

    it 'yields self and returns result if it is not nil' do
      subject.tie(&p).should == 'result returned from calling block on self'
    end

    it 'yields self and returns self if result of yielding is nil' do
      subject.tie{|o| nil }.should == subject
    end

    it 'yields self and returns self if result of yielding is false' do
      subject.tie{|o| false }.should == subject
    end
  end

  context 'no arguments and no block given' do
    it 'raises ArgumentError' do
      expect { subject.tie }.to raise_error ArgumentError, "Object#tie method requires any arguments or block"
    end
  end
end
