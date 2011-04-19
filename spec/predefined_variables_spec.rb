require 'spec_helper'
require 'english'

# http://www.cs.auckland.ac.nz/references/ruby/ProgrammingRuby/language.html

describe "predifined variables" do

  it "should have exceptions" do
    begin
      raise 'an error'
    rescue => err
      err.should_not be_nil
      $!.should_not be_nil
      $ERROR_INFO.should_not be_nil
      $@.should_not be_nil
      $ERROR_POSITION.should_not be_nil
      caller.should_not be_nil
    end
  end

  it "should have args" do
    $*.should have(0).things
    $*.should eql($ARGV)
    $*.should be_an_instance_of(Array)
  end

  it "should have child status" do
    fork { sleep 1}
    Process.wait()
    $?.should_not be_nil
    $?.should eql($CHILD_STATUS)
    $?.should be_an_instance_of(Process::Status)
  end

  it "should have default input" do
    $<.should_not be_nil
    $<.should eql($DEFAULT_INPUT)
  end

  it "should have default output" do
    $>.should_not be_nil
    $>.should eql($DEFAULT_OUTPUT)
    $>.should be_an_instance_of(IO)
  end

  it "should have field separator" do
    $;.should eql($FIELD_SEPARATOR)
    $;.should eql($FS)
    $;.should be_nil
  end

  it "should have input linenumber" do
    IO.readlines(__FILE__)
    $..should_not be_nil
    $..should eql($INPUT_LINE_NUMBER)
  end
end
