require 'socket'

module Scanner
  class PortScanner < Base
    def scan(port_range)
      {}.tap do |ports|
        port_range.each do |port|
          begin
            sock = Socket.new :INET, :STREAM
            raw = Socket.sockaddr_in port, @system.ip
            sock.connect raw
            open_port = true
          rescue Errno::ECONNREFUSED => e
            open_port = false
          end

          ports[port] = open_port
        end
      end
    end
  end
end
