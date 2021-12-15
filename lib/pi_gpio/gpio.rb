# frozen_string_literal: true

class PiGPIO
  class GPIO
    MODE_VALUES = %i[
      input
      output
      alt5
      alt4
      alt0
      alt1
      alt2
      alt3
    ].freeze
    MODE_CODES = {
      input: "R",
      output: "W",
      alt0: 0,
      alt1: 1,
      alt2: 2,
      alt3: 3,
      alt4: 4,
      alt5: 5
    }.freeze
    MODES = MODE_CODES.keys.freeze
    private_constant :MODE_VALUES, :MODE_CODES

    attr_accessor :invert_logic
    attr_reader :g

    def initialize(pigpio, g) # rubocop:disable Naming/MethodParameterName
      @pigpio = pigpio
      @g = g
      @invert_logic = false
    end

    def inspect
      vals = {
        g: g,
        invert_logic: invert_logic,
        mode: @mode
      }.compact
      "#<PiGPIO::GPIO #{vals.map { |k, v| "#{k}=#{v.inspect}" }.join(" ")}>"
    end

    def mode
      @mode ||= MODE_VALUES[command("mg #{g}")]
    end

    def mode=(value)
      raise ArgumentError, "Invalid mode #{value.inspect}" unless MODE_CODES.key?(value)

      @mode = nil
      command("m #{g} #{MODE_CODES[value]}")
    end

    def pull_up_down=(value)
      raise ArgumentError, "Invalid setting #{value.inspect}" unless %i[up down off].include?(value)

      command("pud #{g} #{value.to_s.first}")
    end

    def level
      result = !command("r #{g}").zero?
      result = !result if invert_logic
      result
    end

    def level=(value)
      raise ArgumentError, "Invalid level #{value.inspect}" unless [true, false].include?(value)

      value = !value if invert_logic
      command("w #{g} #{value ? 1 : 0}")
    end

    private

    def command(command)
      @pigpio.send(:command, command)
    end
  end
end
