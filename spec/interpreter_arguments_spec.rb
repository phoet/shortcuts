require 'spec_helper'

describe 'interpreter arguments' do

  it "should execute ruby with -e" do
    `ruby -e 'puts "hello"'`.should eql("hello\n")
  end

  it "should get input line by line with -ne" do
    `ls | sort | ruby -ne 'puts $_'`.should eql("Gemfile\nGemfile.lock\nRakefile\nspec\n")
  end

end
