require 'test_helper'

class StringSubstitutionTest < Test::Unit::TestCase

  def test_substitution
    {
      :alert        => "\a",    :backspace    => "\b",
      :escape       => "\e",    :formfeed     => "\f",
      :newline      => "\n",    :return       => "\r" ,
      :space        => "\s",    :tab          => "\t",
      :vertical_tab => "\v",    :octal_number => "\n00",
      :hex_number   => "\x00",  :control_x    => "\cx",
      :meta_x       => "\M-x",
      
    }.each{|key, value| puts "#{key} = '#{value}'"}
  end

end