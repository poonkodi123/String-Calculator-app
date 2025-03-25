require 'rails_helper'

RSpec.describe StringCalculator, type: :service do
  describe '.add' do
    context 'with empty string' do
      it 'returns 0' do
        expect(StringCalculator.add('')).to eq(0)
      end
    end

    context 'with single number' do
      it 'returns the number' do
        expect(StringCalculator.add('1')).to eq(1)
      end
    end

    context 'with two numbers' do
      it 'returns their sum' do
        expect(StringCalculator.add('1,2')).to eq(3)
      end
    end

    context 'with two numbers' do
      it 'returns their substraction' do
        expect(StringCalculator.substraction('1,2')).to eq(3)
      end
    end  

    context 'with newlines as delimiters' do
      it 'returns the sum' do
        expect(StringCalculator.add("1\n2,3")).to eq(6)
      end
    end

    context 'with custom delimiter' do
      it 'returns the sum' do
        expect(StringCalculator.add("//;\n1;2")).to eq(3)
      end
    end

    context 'with multi-character delimiter' do
      it 'returns the sum' do
        expect(StringCalculator.add("//[***]\n1***2***3")).to eq(6)
      end
    end

    context 'with negative numbers' do
      it 'raises an error' do
        expect { StringCalculator.add('1,-2,3') }.to raise_error('Negatives not allowed: -2')
      end
    end

    context 'with numbers over 1000' do
      it 'ignores them' do
        expect(StringCalculator.add('2,1001')).to eq(2)
      end
    end
  end
end