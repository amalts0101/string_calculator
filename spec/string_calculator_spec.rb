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
  end
end
