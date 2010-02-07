require 'test_helper'

class PercentStyleTest < Test::Unit::TestCase

  def test_syntactical_expression
    %(double-quoted string with parenthesis)
    %q(a (nested) string)
    %[double-quoted string with brackets]
    %{double-quoted string with curly braces}
    %<double-quoted string with angle brackets>
    %!double-quoted string with exclamation mark!
    %/double-quoted string with slashes/
    %-double\-quoted string with minus-
    # ...
    %[
      multi
      line
      expression
    ]
  end

  def test_double_quoted_string
    assert_equal("double-quoted string", %[double-quoted string])
    assert_equal("double-quoted string", %Q[double-quoted string])
    assert_equal("double-quoted string with interpolation", %[double-quoted string #{'with interpolation'}])
    assert_equal("double-quoted string with interpolation", %Q[double-quoted string #{'with interpolation'}])
  end

  def test_single_quoted_string
    assert_equal('single-quoted string', %q[single-quoted string])
    assert_equal('single-quoted string #{\'without interpolation\'}', %q[single-quoted string #{'without interpolation'}])
  end

  def test_double_quoted_words
    assert_equal(["double", "quoted", "words"], %W[double quoted words])
    assert_equal(["double", "quoted words"], %W[double quoted\ words])
    assert_equal(["double", "quoted", "words", "with interpolation"], %W[double quoted words #{'with interpolation'}])
  end

  def test_single_quoted_words
    assert_equal(['single', 'quoted', 'words'], %w[single quoted words])
    assert_equal(['single', 'quoted', 'words', '#{\'without', 'interpolation\'}'], %w[single quoted words #{'without interpolation'}])
  end

  def test_backtick_execute
    assert_equal(`ls`, %x[ls])
  end

  def test_reqular_expressions
    assert_equal(/regexp/, %r[regexp])
    assert_equal(/regexp/i, %r[regexp]i)
  end

  def test_symbol
    assert_equal(:symbol, %s[symbol])
  end

end