# frozen_string_literal: true

require "io/wait"
require "singleton"

require "pi_gpio/errors"
require "pi_gpio/gpio"

class PiGPIO
  include Singleton

  attr_reader :gpios

  def initialize
    @pigpio = File.open("/dev/pigpio", "wb")
    @pigout = File.open("/dev/pigout", "rb")

    @gpios = Array.new(54) { |g| GPIO.new(self, g) }
  end

  def inspect
    "#<PiGPIO>"
  end

  private

  def command(command)
    @pigpio.puts(command)
    @pigpio.flush
    @pigout.wait_readable
    result = @pigout.read_nonblock(256).strip.to_i
    if result.negative?
      error_index = -result - 1
      raise Error.new(result, ERRORS[error_index])
    end
    result
  end
end
