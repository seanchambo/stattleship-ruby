require 'string_helpers'

module Factory
  module ModuleFactory
    def self.included base
      base.extend ClassMethods
    end

    module ClassMethods
      def define_module(prefix:, namespace: nil, modules: [], &block)
        modul = Module.new

        for mod in modules
          modul.include mod
        end
        modul.include self

        base_namespace = namespace ? namespace : self.name.deconstantize

        base_module = eval(base_namespace)
        base_module.const_set(
          "#{prefix.camelize}#{self.name.demodulize}",
          modul
        )

        modul.instance_eval(&block) if block_given?
        modul
      end
    end
  end

  module ClassFactory
    def self.included base
      base.extend ClassMethods
    end

    module ClassMethods
      def define_class(prefix:, namespace: nil,  &block)
        klass = Class.new(self)

        base_namespace = namespace ? namespace : self.name.deconstantize

        base_module = eval(base_namespace)
        base_module.const_set(
          "#{prefix.camelize}#{self.name.demodulize}",
          klass
        )

        klass.instance_eval(&block) if block_given?
        klass
      end
    end
  end
end
