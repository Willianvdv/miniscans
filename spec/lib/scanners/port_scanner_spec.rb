require './spec/spec_helper'

system_class = Struct.new :host_name, :ip

describe Scanner::PortScanner do
  let(:scanner) { described_class.new system_class.new('example.com', '0.0.0.0') }

  describe '.scan' do
    subject { scanner.scan (631..632) }

    it '631 is an open port' do
      expect(subject[631]).to eq true
    end

    it '632 is an closed port' do
      expect(subject[631]).to eq true
    end
  end
end
