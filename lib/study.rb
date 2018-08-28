require "study/version"
require 'pry'

module Study
  class Config
    def initialize(&block)
      @data = {}
      instance_eval(&block)
    end
    
    def method_missing(name, *args, &block)
      puts '===== name ====='
      puts name.to_s + " called"
      puts '===== args ====='
      puts args
      puts '===== block ====='
      puts block
      puts '===== block_given? ====='
      puts block_given?
      puts '===== ret args0 ====='
      args[0]
      puts '===== data ====='
      puts @data
    end

    def fff

    end

    def self.build(&block)
      raise ArgumentError if !block_given?
      Config.new(&block)
    end

  end
end
