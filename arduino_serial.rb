require 'rubygems'
require 'serialport'

module Arduino
  extend self
  
  def send(char)
    port_str = "/dev/tty.usbserial-A7006109"  # This is spicific to your computer
    baud_rate = 9600
    data_bits = 8
    stop_bits = 1
    parity = SerialPort::NONE
    
    begin
      sp = SerialPort.new(port_str, baud_rate, data_bits, stop_bits, parity)
      sp.putc char
    ensure
      sp.close
    end
  end
end


char = ARGV[0] || 'r'
Arduino.send(char)

