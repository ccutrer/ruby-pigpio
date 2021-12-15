# frozen_string_literal: true

class PiGPIO
  class Error < RuntimeError
    attr_reader :code

    def initialize(code, message)
      @code = code
      super(message)
    end
  end

  ERRORS = [
    "gpioInitialise failed",
    "GPIO not 0-31",
    "GPIO not 0-53",
    "mode not 0-7",
    "level not 0-1",
    "pud not 0-2",
    "pulsewidth not 0 or 500-2500",
    "dutycycle outside set range",
    "timer not 0-9",
    "ms not 10-60000",
    "timetype not 0-1",
    "seconds < 0",
    "micros not 0-999999",
    "gpioSetTimerFunc failed",
    "timeout not 0-60000",
    "DEPRECATED: no alert func",
    "clock peripheral not 0-1",
    "DEPRECATED: bad clk source",
    "clock micros not 1, 2, 4, 5, 8, or 10",
    "buf millis not 100-10000",
    "dutycycle range not 25-40000",
    "signum not 0-63",
    "can't open pathname",
    "no handle available",
    "unknown handle",
    "ifFlags > 4",
    "DMA channel not 0-15",
    "socket port not 1024-32000",
    "unrecognized fifo command",
    "DMA secondary channel not 0-15",
    "function called before gpioInitialise",
    "function called after gpioInitialise",
    "waveform mode not 0-3",
    "bad parameter in gpioCfgInternals call",
    "baud rate not 50-250K(RX)/50-1M(TX)",
    "waveform has too many pulses",
    "waveform has too many chars",
    "no bit bang serial read on GPIO",
    "bad (null) serial structure parameter",
    "bad (null) serial buf parameter",
    "GPIO operation not permitted",
    "one or more GPIO not permitted",
    "bad WVSC subcommand",
    "bad WVSM subcommand",
    "bad WVSP subcommand",
    "trigger pulse length not 1-100",
    "invalid script",
    "unknown script id",
    "add serial data offset > 30 minutes",
    "GPIO already in use",
    "must read at least a byte at a time",
    "script parameter id not 0-9",
    "script has duplicate tag",
    "script has too many tags",
    "illegal script command",
    "script variable id not 0-149",
    "no more room for scripts",
    "can't allocate temporary memory",
    "socket read failed",
    "socket write failed",
    "too many script parameters (> 10)",
    "script initialising",
    "script has unresolved tag",
    "bad MICS delay (too large)",
    "bad MILS delay (too large)",
    "non existent wave id",
    "No more CBs for waveform",
    "No more OOL for waveform",
    "attempt to create an empty waveform",
    "no more waveforms",
    "can't open I2C device",
    "can't open serial device",
    "can't open SPI device",
    "bad I2C bus",
    "bad I2C address",
    "bad SPI channel",
    "bad i2c/spi/ser open flags",
    "bad SPI speed",
    "bad serial device name",
    "bad serial baud rate",
    "bad i2c/spi/ser parameter",
    "i2c write failed",
    "i2c read failed",
    "bad SPI count",
    "ser write failed",
    "ser read failed",
    "ser read no data available",
    "unknown command",
    "spi xfer/read/write failed",
    "bad (NULL) pointer",
    "no auxiliary SPI on Pi A or B",
    "GPIO is not in use for PWM",
    "GPIO is not in use for servo pulses",
    "GPIO has no hardware clock",
    "GPIO has no hardware PWM",
    "invalid hardware PWM frequency",
    "hardware PWM dutycycle not 0-1M",
    "invalid hardware clock frequency",
    "need password to use hardware clock 1",
    "illegal, PWM in use for main clock",
    "serial data bits not 1-32",
    "serial (half) stop bits not 2-8",
    "socket/pipe message too big",
    "bad memory allocation mode",
    "too many I2C transaction segments",
    "an I2C transaction segment failed",
    "SMBus command not supported by driver",
    "no bit bang I2C in progress on GPIO",
    "bad I2C write length",
    "bad I2C read length",
    "bad I2C command",
    "bad I2C baud rate, not 50-500k",
    "bad chain loop count",
    "empty chain loop",
    "too many chain counters",
    "bad chain command",
    "bad chain delay micros",
    "chain counters nested too deeply",
    "chain is too long",
    "deprecated function removed",
    "bit bang serial invert not 0 or 1",
    "bad ISR edge value, not 0-2",
    "bad ISR initialisation",
    "loop forever must be last command",
    "bad filter parameter",
    "bad pad number",
    "bad pad drive strength",
    "file open failed",
    "bad file mode",
    "bad file flag",
    "bad file read",
    "bad file write",
    "file not open for read",
    "file not open for write",
    "bad file seek",
    "no files match pattern",
    "no permission to access file",
    "file is a directory",
    "bad shell return status",
    "bad script name",
    "bad SPI baud rate, not 50-500k",
    "no bit bang SPI in progress on GPIO",
    "bad event id",
    "Used by Python",
    "not available on BCM2711",
    "only available on BCM2711"
  ].freeze
  private_constant :ERRORS
end
