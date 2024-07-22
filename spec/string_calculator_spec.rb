# string_calculator_spec.rb
require 'rspec'

require_relative '../lib/string_calculator'

RSpec.describe StringCalculator do
  subject { StringCalculator }
  describe ".add" do
    it "returns 0 for an empty string" do
      expect(subject.add("")).to eq(0)
    end

    context "single number" do
      it "returns 5 for 5" do
        expect(subject.add("5")).to eq(5)
      end

      it "returns 10 for 10" do
        expect(subject.add("10")).to eq(10)
      end

      it "returns 20 for 20" do
        expect(subject.add("20")).to eq(20)
      end
    end

    context "2 numbers" do
      it "returns 5 for 2,3" do
        expect(subject.add("2,3")).to eq(5)
      end

      it "returns 6 for 3,3" do
        expect(subject.add("3,3")).to eq(6)
      end

      it "returns 22 for 20,2" do
        expect(subject.add("20,2")).to eq(22)
      end
    end

    context "unknown amount of numbers" do
      it "returns 10 for 5,3,2" do
        expect(subject.add("5,3,2")).to eq(10)
      end

      it "returns 40 for 10,10,10,10" do
        expect(subject.add("10,10,10,10")).to eq(40)
      end

      it "returns 15 for 3,3,3,3,3" do
        expect(subject.add("3,3,3,3,3")).to eq(15)
      end
    end

    context "newline as delimiter" do
      it "returns 5 for 1\n4" do
        expect(subject.add("1\n4")).to eq(5)
      end

      it "returns 10 for 5\n5" do
        expect(subject.add("5\n5")).to eq(10)
      end

      it "returns 35 for 5\n10,20" do
        expect(subject.add("5\n10,20")).to eq(35)
      end
    end

    context "mixed delimiters" do
      it "returns 8 for 2\n1\n5" do
        expect(subject.add("2\n1\n5")).to eq(8)
      end

      it "returns 55 for 5\n10\n20\n20" do
        expect(subject.add("5\n10\n20\n20")).to eq(55)
      end
    end

    context "support different delimiters" do
      it "returns 4 for //;\n1;2;1" do
        expect(subject.add("//;\n1;2;1")).to eq(4)
      end

      it "returns 11 for //:\n4:5:2" do
        expect(subject.add("//:\n4:5:2")).to eq(11)
      end

      it "returns 60 for //.\n10.20.30" do
        expect(subject.add("//.\n10.20.30")).to eq(60)
      end
    end
  end
end
