class CIIndicator < ArduinoSketch
  output_pin  9, :as => :green
  output_pin 12, :as => :red
  input_pin   5, :as => :button, :device => :button
  
  serial_begin
  @broken = true
  
  # This is the main loop that the arduino will run
  def loop
    read
    toggle if button.read_input
    
    if @broken
      blink red, speed
      green.digitalWrite LOW
    else
      green.digitalWrite HIGH
    end
  end
  
  # Just make the red blinking a little interisting
  @speed = 1
  @delta = 1
  def speed
    if @speed > 100
      @delta = -1
    elsif @speed < 1
      @delta = 1
    end
    return @speed += @delta # another C annoyance
  end
  
  def toggle
    @broken = !@broken
  end
  
  # See if anything has been sent via serial
  @sig = int # Without this the C won't compile
  def read
    if serial_available
      @sig = serial_read
      if @sig == 'g'
        @broken = false
      elsif @sig == 'r'
        @broken = true
      else
        toggle
      end
    end
  end
end
