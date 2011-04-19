require 'spec_helper'

describe 'percent style variables' do
  
  it "should have syntactical expressions" do
    %(double-quoted string with parenthesis).should_not be_nil
    %q(a (nested) string).should_not be_nil
    %[double-quoted string with brackets].should_not be_nil
    %{double-quoted string with curly braces}.should_not be_nil
    %<double-quoted string with angle brackets>.should_not be_nil
    %!double-quoted string with exclamation mark!.should_not be_nil
    %/double-quoted string with slashes/.should_not be_nil
    %-double\-quoted string with minus-.should_not be_nil
    # ...
    %[
      multi
      line
      expression
    ].should_not be_nil
  end

  it "should have double quoted string" do
    "double-quoted string".should eql(%[double-quoted string])
    "double-quoted string".should eql(%Q[double-quoted string])
    "double-quoted string with interpolation".should eql(%[double-quoted string #{'with interpolation'}])
    "double-quoted string with interpolation".should eql(%Q[double-quoted string #{'with interpolation'}])
  end

  it "should have single quoted_string" do
    'single-quoted string'.should eql(%q[single-quoted string])
    'single-quoted string #{\'without interpolation\'}'.should eql(%q[single-quoted string #{'without interpolation'}])
  end

  it "should have double quoted words" do
    ["double", "quoted", "words"].should eql(%W[double quoted words])
    ["double", "quoted words"].should eql(%W[double quoted\ words])
    ["double", "quoted", "words", "with interpolation"].should eql(%W[double quoted words #{'with interpolation'}])
  end

  it "should have single quoted words" do
    ['single', 'quoted', 'words'].should eql(%w[single quoted words])
    ['single', 'quoted', 'words', '#{\'without', 'interpolation\'}'].should eql(%w[single quoted words #{'without interpolation'}])
  end

  it "should have backtick execute" do
    `ls`.should eql(%x[ls])
  end

  it "should have reqular expressions" do
    /regexp/.should eql(%r[regexp])
    /regexp/i.should eql(%r[regexp]i)
  end

  it "should have symbol" do
    :symbol.should eql(%s[symbol])
  end

end