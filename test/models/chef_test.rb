require 'test_helper'

class ChefTest < ActiveSupport::TestCase
  def setup
    @chef = Chef.new(chefname: "john", email: "john@example.com")
  end
    
    test "chef should be valid" do
      
      assert @chef.valid?
    end
    
    test "chefname should be present" do
        @chef.chefname = " "
    assert_not @chef.valid?
  end
  
  test "name length <41" do
    @chef.chefname = "a" * 41
    assert_not @chef.valid?
      end
  
  test "name length not too short" do
    @chef.chefname = "aa"
    assert_not @chef.valid?
    end
    
    test "email present" do
      @chef.email =""
      assert_not @chef.valid?
    end
    
    test "email length in bounds" do
      @chef.email = "a" * 101 + "example.com"
    assert_not @chef.valid?
    end

  test "email should be unique" do
  dup_chef = @chef.dup
  dup_chef.email = @chef.email.upcase
  @chef.save
  assert_not dup_chef.valid?
  end
  
  test "email should be valid" do
  valid_addresses = %w[user@eee.com R_TDD-DS@eee.hello.org user@example.com first.last@eee.au laura+joe@monk.cm]
  valid_addresses.each do |va|
    @chef.email = va
    assert @chef.valid?, '#{va.inspect} should be valid'
  end
end
  
  test " email should reject invalid addresses" do
    
  invalid_addresses = %w[user@eee,com R_TDD-DSateee.hello.org user@example. first.last@e_e_e.au laura+joe@monk.c+m]
  invalid_addresses.each do |iva|
    @chef.email = iva
    assert_not @chef.valid?, '#{iva.inspect} should be invalid'
  end
end
  

    
end