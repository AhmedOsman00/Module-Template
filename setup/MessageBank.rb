module Pod
  class MessageBank
    attr_reader :pod_name

    def initialize(pod_name)
      @pod_name = pod_name
    end

    def show_prompt
      print " > ".green
    end

    def yellow_bang
      "! ".yellow
    end

    def green_bang
      "! ".green
    end

    def red_bang
      "! ".red
    end

    def run_command command, output_command=nil
      output_command ||= command

      puts "  " + output_command.magenta
      system command
    end

    def farewell_message
      puts ""

      puts " Ace! you're ready to go!"
      puts " Add the #{pod_name} to your project and start development."
    end
  end
end
