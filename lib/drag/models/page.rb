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
        base.send :include, InstanceMethods
        base.before_save :max_order
      end
      
      module InstanceMethods
        def max_order
          return unless new_record?
          maxorder = self.class.find_last_by_parent_id parent_id, :order => ["position ASC"]
          if maxorder
            self.position = maxorder.position + 1
          else
            self.position = 1
          end
        end
      end
      
    end
  end
end
