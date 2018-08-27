require "study/version"
require 'pry'

module Study
  class Config
    attr_accessor :value
    def self.method_missing name, *args, &block #name - имя метода, *args - его аттрибуты, &block - блок кода если есть.
      puts name.to_s + " called"
    end

    def self.build &block
      raise ArgumentError if !block_given?
      yield block
    end

  end
end
