ActionController::Routing::Routes.draw do |map|
  
  map.with_options :controller => 'admin/pages' do |page|
    page.page_move_to "admin/pages/:id/move_to/:rel/:pos/:copy", :action => "move_to"
    #going to have to change this once changes are made to acts_as_tree
    #http://groups.google.com/group/radiantcms-dev/browse_thread/thread/83d62f75dc20e645/6833cf5afe0b69a4?lnk=raot&fwc=2
  end
  
end