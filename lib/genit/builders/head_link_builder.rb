# -*- encoding: utf-8 -*-

module Genit

  # Modify head link tags.
  class HeadLinkBuilder < BuilderBase
    
    # Public: Build the document head link tags of a particular page.
    #
    # page_name - The string filename of the page.
    #
    # Returns the modified Nokogiri::XML::Document
    def build_for_page page_name
      build page_name, head_links
    end
    
    private
    
    def head_links
      @document.css("head link")
    end
    
    def update link
      @path = link['href']
      return if not_an_internal_link?
      nb = BuilderBase::get_number_of_base_dirs @page_name
      make_relative nb
      link['href'] = @path
    end
    
    def not_an_internal_link?
      @path.nil? or @path =~ URI::regexp
    end
    
  end
  
end
