require 'test_helper'

class SaimaaTest < Test::Unit::TestCase
  context "execute method" do
    should "return status 0 when good command" do
      stat, result = Saimaa::Command.execute("ls /tmp", "test")
      assert_equal 0, stat.to_i
    end

    should "reutnr status not 0 when bad comand" do
      stat, result = Saimaa::Command.execute("ls /tmpppp", "test")
      assert_not_equal 0, stat.to_i
    end
  end
end
