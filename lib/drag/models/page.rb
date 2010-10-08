module Drag
  module Models
    module Page
      
      def self.included(base)
        base.class_eval do
          self.reflections[:children].options[:order] = 'position ASC'
          
          if defined?(Page::NONDRAFT_FIELDS)
            Page::NONDRAFT_FIELDS << 'position'
          end
        end
      end
      
    end
  end
end
