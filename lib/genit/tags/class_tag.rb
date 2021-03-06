# -*- encoding: utf-8 -*-

module Genit

  # A Genit general tag.
  class ClassTag < Tag
    
    # Public: Constructor.
    #
    # working_dir - The String working directory, where live the project.
    # template    - The Nokogiri::XML::Document into which we process the tag.
    # filename    - The String name of the page
    # tag         - The tag to process as a Nokogiri::XML::Element
    def initialize working_dir, template, filename, tag
      super working_dir, template, filename, tag
    end
    
    # Public: Replace something in the template.
    #
    # Returns the template as a Nokogiri::XML::Document
    def process
      case @tag['class']
        when 'pages' then ClassPagesTag.new(@working_dir, @template, @filename, @tag).process
        when 'menu' then ClassMenuTag.new(@working_dir, @template, @filename, @tag).process
        when 'fragment' then ClassFragmentTag.new(@working_dir, @template, @filename, @tag).process
        when 'news' then ClassNewsTag.new(@working_dir, @template, @filename, @tag).process
        else
          error "Unknown tag #{@tag}"
      end
    end
    
  end

end
