module Pod

  class ConfigureSwift
    attr_reader :configurator

    def self.perform(options)
      new(options).perform
    end

    def initialize(options)
      @configurator = options.fetch(:configurator)
    end

    def perform
      # There has to be a single file in the Sources dir
      # or a framework won't be created
      `touch ./Sources/ReplaceMe.swift`
      `touch ./Tests/ReplaceMe-Tests.swift`
    end
  end

end
