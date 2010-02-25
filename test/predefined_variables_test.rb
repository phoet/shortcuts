require 'test_helper'
require 'english' 

# http://www.cs.auckland.ac.nz/references/ruby/ProgrammingRuby/language.html

class PredefinedVariablesTest < Test::Unit::TestCase

  def test_exceptions
    begin
      raise 'an error'
    rescue => err
      puts "the error #{err}"
      puts "the error #{$!}"
      puts "the error #{$ERROR_INFO}"
      puts "the stack #{$@}"
      puts "the stack #{$ERROR_POSITION}"
      puts "the stack #{caller}"
    end
  end
  
  def test_argv
    p $*
    assert_equal($*, $ARGV)
    assert_equal($*.is_a?(Array), true)
    assert_kind_of(Array, $*)
  end
  
  def test_child_status
    fork { puts "i am a child"}
    Process.wait()
    p $?
    assert_equal($?, $CHILD_STATUS)
    assert_kind_of(Process::Status, $?)
  end
  
  def test_default_input
    p $<
    assert_equal($<,  $DEFAULT_INPUT)
    assert_kind_of(Object, $<)
  end
  
  def test_default_output
    p $>
    assert_equal($>,  $DEFAULT_OUTPUT)
    assert_kind_of(IO, $>)
  end
  
  def test_field_separator
    p $;
    assert_equal($;, $FIELD_SEPARATOR)
    assert_equal($;, $FS)
    assert_equal($;, nil)
  end
  
  def test_ignorecase
    p $=
    assert_equal($=, $IGNORECASE)
    assert_kind_of(FalseClass, $=)
  end
  
  def test_input_linenumber
    IO.readlines(__FILE__)
    p $.
    assert_equal($., $INPUT_LINE_NUMBER)
  end
end