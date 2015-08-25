require 'spec_helper'

include PacketFu

describe PcapFile, "pcap file operations" do

  before :all do
    pcap_file = File.join(File.dirname(__FILE__),"sample.pcap")
    @packets = PcapFile.read_packets(pcap_file) do |p|

    end
    puts @packets.class.inspect
    exit
  end

  it "writes packets to a file" do
    
    @packets.should be_a_kind_of(Hash)
    res = PcapFile.new.array_to_file(:filename => '/tmp/a.pcap', :array => @packets)
  end
end
