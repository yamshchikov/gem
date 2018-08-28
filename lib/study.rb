require 'study/version'

module Study
  # Config class
  class Config
    def initialize(&block)
      instance_eval(&block)
    end

    def method_missing(name, *args, &block)
      super if args[0].nil? && !block_given?
      instance_variable_set("@#{name}".to_sym, args[0] || Config.build(&block))
      singleton_class.send(:define_method, name, proc {
        instance_variable_get("@#{name}")
      })
    end

    def respond_to_missing?(*)
      true
    end

    def self.build(&block)
      raise ArgumentError unless block_given?
      Config.new(&block)
    end
  end
end
