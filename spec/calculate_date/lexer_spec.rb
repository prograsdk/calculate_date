# frozen_string_literal: true

require 'calculate_date/lexer'
require 'calculate_date/token'

RSpec.describe CalculateDate::Lexer do
  describe '#next_token' do
    context 'number' do
      it 'should set current_token to "1"' do
        lexer = CalculateDate::Lexer.new("1");

        expect(lexer.next_token.value).to eq(1)
      end
    end
  end

  describe '#next_token' do
    context ' when parsing unkonwn syntax' do
      it 'should raise SyntaxError' do
        lexer = CalculateDate::Lexer.new("!");

        expect{ lexer.next_token }.to raise_error(CalculateDate::Exceptions::SyntaxError)
      end
    end

    context 'number' do
      it 'should parse "1"' do
        lexer = CalculateDate::Lexer.new("1");

        expect(lexer.next_token.value).to eq(1)
      end

      it 'should parse "1 2"' do
        lexer = CalculateDate::Lexer.new("1 2");

        expect(lexer.next_token.value).to eq(1)
        expect(lexer.next_token.value).to eq(2)
      end

      it 'should parse "12"' do
        lexer = CalculateDate::Lexer.new("12");

        expect(lexer.next_token.value).to eq(12)
      end

      it 'should parse "120"' do
        lexer = CalculateDate::Lexer.new("120");

        expect(lexer.next_token.value).to eq(120)
      end

      it 'should parse "12 1 100"' do
        lexer = CalculateDate::Lexer.new("12 1 100");

        expect(lexer.next_token.value).to eq(12)
        expect(lexer.next_token.value).to eq(1)
        expect(lexer.next_token.value).to eq(100)
      end

      it 'should all tokens be INTEGER type when parsing "12 1 100"' do
        lexer = CalculateDate::Lexer.new("12 1 100");

        expect(lexer.next_token.type).to eq(CalculateDate::Token::INTEGER)
        expect(lexer.next_token.type).to eq(CalculateDate::Token::INTEGER)
        expect(lexer.next_token.type).to eq(CalculateDate::Token::INTEGER)
      end
    end

    context 'plus' do
      it 'should parse +' do
        lexer = CalculateDate::Lexer.new("+");

        expect(lexer.next_token.value).to eq('+')
      end

      it 'should all tokens be PLUS type when parsing "+"' do
        lexer = CalculateDate::Lexer.new("+");

        expect(lexer.next_token.type).to eq(CalculateDate::Token::PLUS)
      end
    end

    context 'minus' do
      it 'should parse -' do
        lexer = CalculateDate::Lexer.new("-");

        expect(lexer.next_token.value).to eq('-')
      end

      it 'should all tokens be PLUS type when parsing "-"' do
        lexer = CalculateDate::Lexer.new("-");

        expect(lexer.next_token.type).to eq(CalculateDate::Token::MINUS)
      end
    end

    context 'date_units' do
      context 'day' do
        it 'should parse date unit' do
          lexer = CalculateDate::Lexer.new('day')

          expect(lexer.next_token.type).to eq(CalculateDate::Token::DATE_UNIT)
        end

        it 'should parse day' do
          lexer = CalculateDate::Lexer.new('day')

          expect(lexer.next_token.value).to eq('day')
        end
      end

      context 'days' do
        it 'should parse date unit' do
          lexer = CalculateDate::Lexer.new('days')

          expect(lexer.next_token.type).to eq(CalculateDate::Token::DATE_UNIT)
        end

        it 'should parse day' do
          lexer = CalculateDate::Lexer.new('days')

          expect(lexer.next_token.value).to eq('days')
        end
      end

      context 'month' do
        it 'should parse date unit' do
          lexer = CalculateDate::Lexer.new('month')

          expect(lexer.next_token.type).to eq(CalculateDate::Token::DATE_UNIT)
        end

        it 'should parse month' do
          lexer = CalculateDate::Lexer.new('month')

          expect(lexer.next_token.value).to eq('month')
        end
      end

      context 'months' do
        it 'should parse date unit' do
          lexer = CalculateDate::Lexer.new('months')

          expect(lexer.next_token.type).to eq(CalculateDate::Token::DATE_UNIT)
        end

        it 'should parse month' do
          lexer = CalculateDate::Lexer.new('months')

          expect(lexer.next_token.value).to eq('months')
        end
      end

      context 'year' do
        it 'should parse date unit' do
          lexer = CalculateDate::Lexer.new('year')

          expect(lexer.next_token.type).to eq(CalculateDate::Token::DATE_UNIT)
        end

        it 'should parse year' do
          lexer = CalculateDate::Lexer.new('year')

          expect(lexer.next_token.value).to eq('year')
        end
      end

      context 'years' do
        it 'should parse date unit' do
          lexer = CalculateDate::Lexer.new('years')

          expect(lexer.next_token.type).to eq(CalculateDate::Token::DATE_UNIT)
        end

        it 'should parse year' do
          lexer = CalculateDate::Lexer.new('years')

          expect(lexer.next_token.value).to eq('years')
        end
      end
    end
  end
end
