# -*- encoding: utf-8 -*-

require './spec/helper'

describe "Standard class String extensions" do

  it "should replace a markdown file ext" do
    string = "file.markdown"
    result = string.force_html_extension
    result.should == "file.html"
  end
  
  it "should replace a markdown file ext !" do
    string = "file.markdown"
    string.force_html_extension!
    string.should == "file.html"
  end
  
  it "should not replace an other file ext" do
    string = "file.txt"
    string.force_html_extension!
    string.should == "file.txt"
  end
  
  it "should say if it has a markdown file extension" do
    string = "file.markdown"
    string.markdown_ext?.should be_true
  end
  
  it "should say if it has not a markdown file extension" do
    string = "file.other"
    string.markdown_ext?.should be_false
  end

end
