# frozen_string_literal: true
require "rails/generators"
require "boring_generators"

module BoringGenerators
  class CLI < Thor
    map "g" => :generate
    map %w(--version -v) => :__print_version

    desc "generate [NAMESPACE] [OPTION]", "Add gem to the application"
    def generate(namespace, *args)
      Rails::Generators.invoke(namespace, args)
    end

    desc "--version, -v", "Print gem version"
    def __print_version
      puts "Boring generators #{BoringGenerators::VERSION}"
    end

    class << self
      def exit_on_failure?
        true
      end
    end
  end
end
