# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application_controller'

class DragExtension < Radiant::Extension
  version "1.0"
  description "Radiant Drag allows you to reorder pages"
  url "http://github.com/squaretalent/radiant-drag-extension"
  
  def activate
    # Interface
    admin.pages.index.add :sitemap_head, "drag_order_header", :before=>"title_column_header"
    admin.pages.index.add :node,         "drag_order",        :before=>"title_column"
    
    # Models
    Page.send :include, Drag::Models::Page
    
    # Tags
    StandardTags.send :include, Drag::Tags::Core
    
    # Controllers
    Admin::PagesController.send :include, Drag::Controllers::PagesController
    
    # Helpers
    Admin::PagesController.send :helper, Drag::Helpers::PagesController
  end
  
end