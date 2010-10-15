module Drag
  module Tags
    module Core
      
      def self.included(base)
        base.class_eval do
          alias_method :radiant_children_find_options, :children_find_options
          
          def children_find_options(tag)
            options = radiant_children_find_options(tag)
            
            options[:order].sub!(/published_at/i, 'position') unless tag.attr['by']
            
            options
          end
        end
      end
      
    end
  end
end