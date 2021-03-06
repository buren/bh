require 'bh/classes/base'

module Bh
  module Classes
    class ProgressBar < Base
      # @return [#to_s] the context-related class to assign to the progress bar.
      def context_class
        contexts[@options[:context]]
      end

      # @return [#to_s] the class to assign to make the progress bar striped.
      def striped_class
        stripes[@options[:striped]]
      end

      # @return [#to_s] the class to assign to make the progress bar aniamted.
      def animated_class
        animations[@options[:animated]]
      end

      # @return [#to_s] the text to display as the label of the progress bar.
      def label
        labels[@options.fetch :label, false] || @options[:label]
      end

      def values
        {}.tap do |values|
          values[:style] = "width: #{percentage}%"
          values[:role] = :progressbar
          values[:'aria-valuenow'] = percentage
          values[:'aria-valuemin'] = 0
          values[:'aria-valuemax'] = 100
        end
      end

      # @return [Hash<Symbol, String>] the classes that Bootstrap requires to
      #   append to the progress bar for each possible context.
      def contexts
        HashWithIndifferentAccess.new.tap do |klass|
          klass[:danger]  = :'progress-bar-danger'
          klass[:info]    = :'progress-bar-info'
          klass[:success] = :'progress-bar-success'
          klass[:warning] = :'progress-bar-warning'
        end
      end

      # @return [Hash<Symbol, String>] the classes that Bootstrap requires to
      #   append to the progress bar to make it look striped.
      def stripes
        HashWithIndifferentAccess.new.tap do |klass|
          klass[true]  = :'progress-bar-striped'
        end
      end

      # @return [Hash<Symbol, String>] the classes that Bootstrap requires to
      #   append to the progress bar to make it look animated.
      def animations
        HashWithIndifferentAccess.new.tap do |klass|
          klass[true]  = :'progress-bar-striped active'
        end
      end

      # @return [Hash<Symbol, String>] the texts to uses as labels.
      def labels
        HashWithIndifferentAccess.new.tap do |label|
          label[true]  = text
          label[false]  = @app.content_tag(:span, text, class: 'sr-only')
        end
      end

    private

      def percentage
        @options.fetch :percentage, 0
      end

      def text
        "#{percentage}%".tap do |text|
          text << " (#{@options[:context]})" if @options[:context]
        end
      end
    end
  end
end