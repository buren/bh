require 'bh/classes/base'

module Bh
  module Classes
    class Icon < Base
      # @return [#to_s] the class to assign to the icon based on the Vector
      #   Icon library used.
      def library_class
        libraries[@options[:library].to_s.underscore] || @options[:library]
      end

      # @return [#to_s] the class to assign to the icon based on the name
      #   of the icon.
      def name_class
        if name = @options[:name]
          "#{library_class}-#{name.to_s.gsub '_', '-'}" 
        end
      end


      # @return [Hash<Symbol, String>] the classes that Bootstrap requires to
      #   append to icons for each possible vector icon library.
      def libraries
        HashWithIndifferentAccess.new(nil).tap do |klass|
          klass[:font_awesome]  = :'fa'
          klass[:glyphicons]    = :'glyphicon'
          klass[:'']            = :'glyphicon'
        end
      end
    end
  end
end