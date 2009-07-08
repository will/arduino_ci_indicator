Arduino Continuos Integration Indicator
=======================================

What good is CI if you don't know the build status? And what's a better way to know the status than blinking LEDs?

arduino_serial.rb
-----------------

This sends a signal to the arduino to tell it to switch states.

    ./arduino_serial.rb character
    character:
      r => red, failed build
      g => green, successful build
      else => toggle status
      
You'll have to figure out the serial port and edit that into the script. Also if when you do this it rests your arudino, it's because the version you have resets itself automatically on receiving serial data. Lucky you. The only way to get around this that I could work out was putting a resistor between the 5v and reset pins, to prevent it from resetting. **Warning:** Take that resistor out before updating the arduino, or your computer will hang and everything goes to hell.

ci_idicator.rb
--------------

This is the code that gets compiled down to C and put on the arduino using [RAD]("http://rad.rubyforge.org/"). Rad uses some old version of ParseTree, so I had to put `gem "ParseTree", "2.2.0"` in the Rakefile to get it to use the old version. They might fix that sometime, but there you go.

license
-------
(uiuc/ncsa open source license)

    Copyright (c) 2009 Will Leinweber.  All rights reserved.
    
    Permission is hereby granted, free of charge, to any person obtaining a copy
    of this software and associated documentation files (the "Software"), to
    deal with the Software without restriction, including without limitation the
    rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
    sell copies of the Software, and to permit persons to whom the Software is
    furnished to do so, subject to the following conditions:
      1. Redistributions of source code must retain the above copyright notice,
         this list of conditions and the following disclaimers.
      2. Redistributions in binary form must reproduce the above copyright
         notice, this list of conditions and the following disclaimers in the
         documentation and/or other materials provided with the distribution.
      3. The names of its contributors may not be used to endorse or promote
         products derived from this Software without specific prior written 
         permission.
    
    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL THE
    CONTRIBUTORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
    FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
    WITH THE SOFTWARE.