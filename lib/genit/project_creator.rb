# -*- encoding: utf-8 -*-

require "fileutils"

module Genit

  # Create a skeleton project.
  class ProjectCreator
  
    # Sole constructor.
    #
    # name  - The String name of the future project folder.
    def initialize name
      @name = name
    end
    
    # Public: Create the structure of the project, that is many
    # files and folders.
    #
    # Returns nothing.
    def create
      begin
				FileUtils.makedirs @name
        create_dirs ['news', 'pages', 'scripts', 'styles', 'templates', 'www']
        create_dirs ['styles/css', 'styles/css/alsa', 'styles/css/yui', 'styles/images']
			rescue SystemCallError
				puts "Cannot create project..."
			end
    end
    
    private
    
    # Create some subfolders inside the project folder.
    #
    # a_array - An Array of String subfolder names
    #
    # Examples
    #
    #   create_dirs ['styles', 'scripts']
    #
    #   create_dirs ['styles/css/alsa', 'styles/css/yui', 'styles/css/images']
    #
    # Returns nothing.
    def create_dirs a_array
      a_array.each {|dir| FileUtils.makedirs File.join(@name, dir) }
    end
    
  end

end