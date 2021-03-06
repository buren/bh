require 'bh/classes/base'

module Bh
  module Classes
    class Button < Base
      # @return [#to_s] the context-related class to assign to the button.
      def context_class
        contexts[@options[:context]]
      end

      # @return [#to_s] the size-related class to assign to the alert box.
      def size_class
        sizes[@options[:size]]
      end

      # @return [#to_s] the layout-related class to assign to the alert box.
      def layout_class
        layouts[@options[:layout]]
      end

      # @return [Hash<Symbol, String>] the classes that Bootstrap requires to
      #   append to buttons for each possible context.
      def contexts
        HashWithIndifferentAccess.new(:'btn-default').tap do |klass|
          klass[:danger]  = :'btn-danger'
          klass[:info]    = :'btn-info'
          klass[:link]    = :'btn-link'
          klass[:primary] = :'btn-primary'
          klass[:success] = :'btn-success'
          klass[:warning] = :'btn-warning'
        end
      end

      # @return [Hash<Symbol, String>] the classes that Bootstrap requires to
      #   append to buttons for each possible size.
      def sizes
        HashWithIndifferentAccess.new.tap do |klass|
          klass[:extra_small] = :'btn-xs'
          klass[:large]       = :'btn-lg'
          klass[:lg]          = :'btn-lg'
          klass[:sm]          = :'btn-sm'
          klass[:small]       = :'btn-sm'
          klass[:xs]          = :'btn-xs'
        end
      end

      # @return [Hash<Symbol, String>] the classes that Bootstrap requires to
      #   append to buttons for each possible layout.
      def layouts
        HashWithIndifferentAccess.new.tap do |klass|
          klass[:block] = :'btn-block'
        end
      end
    end
  end
end