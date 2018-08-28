require "study/version"
require 'pry'

module Study
  class Config
    def initialize(&block)
      instance_eval(&block)
    end
    
    def method_missing(name, *args, &block)
      raise NoMethodError if args[0].nil? && !block_given?
      instance_variable_set("@#{name}".to_sym, args[0] || Config.build(&block))
      self.singleton_class.send(:define_method, name, proc { instance_variable_get("@#{name}")})
    end

    def self.build(&block)
      raise ArgumentError if !block_given?
      Config.new(&block)
    end
  end
end
