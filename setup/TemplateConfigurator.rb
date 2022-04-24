require 'fileutils'
require 'colored2'

module Pod
  class TemplateConfigurator

    attr_reader :pod_name, :module_type

    def initialize(pod_name, module_type)
      @pod_name = pod_name
      @module_type = module_type
      @message_bank = MessageBank.new(pod_name)
    end

    def run
      ConfigureSwift.perform(configurator: self)
      replace_variables_in_files
      clean_template_files
      rename_template_files

      @message_bank.farewell_message
    end

    #----------------------------------------#

    def clean_template_files
      ["./**/.gitkeep", "configure", "_CONFIGURE.rb", "README.md", "templates", "setup"].each do |asset|
        `rm -rf #{asset}`
      end
    end

    def replace_variables_in_files
      file_names = ['POD_README.md', 'NAME.podspec']
      file_names.each do |file_name|
        text = File.read(file_name)
        text.gsub!("${POD_NAME}", @pod_name)
        text.gsub!("${MODULE_TYPE}", @module_type)
        text.gsub!("${USER_NAME}", user_name)
        text.gsub!("${USER_EMAIL}", user_email)
        File.open(file_name, "w") { |file| file.puts text }
      end
    end

    def rename_template_files
      FileUtils.mv "POD_README.md", "README.md"
      FileUtils.mv "NAME.podspec", "#{pod_name}.podspec"
    end

    def validate_user_details
        return (user_email.length > 0) && (user_name.length > 0)
    end

    #----------------------------------------#

    def user_name
      'Ahmed Osman'
    end

    def user_email
      'ahmedosman00@github.com'
    end

    #----------------------------------------#
  end
end
