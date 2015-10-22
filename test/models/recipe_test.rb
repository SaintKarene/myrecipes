require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  
  def setup
    @chef = Chef.create(chefname: "bob", email: "bob@example.com") 
    @recipe = @chef.recipes.build(name: "khmer pie", description: "Cambodian chicken pot pie", summary: "Cambodian herbs and spices mixed with chicken and vegetables into a unique Asia pot pie.")
  end
  
  test "recipe should be valid" do
    assert @recipe.valid?
  end
  
  test "chef_id should be present" do
    @recipe.chef_id = nil
    assert_not @recipe.valid?
  end
  
  test "name should be present" do
    @recipe.name = " "
    assert_not @recipe.valid?
  end
  
  test "name length should not be to long" do
    @recipe.name = "a" * 101
    assert_not @recipe.valid?
  end

  test "name length should not be to short" do
    @recipe.name = "aaaa" 
    assert_not @recipe.valid?
  end


  test "summary must be present" do
  @recipe.summary = " "
    assert_not @recipe.valid?
  end

test "summary length should not be to long" do
  @recipe.summary = "a" * 151
  assert_not @recipe.valid?
end

test "summary length should not be to short" do
@recipe.summary = "a" * 9
  assert_not @recipe.valid?
end

test "description must be present" do
@recipe.description = " "
    assert_not @recipe.valid?
end

test "description length should not be to long" do
  @recipe.description = "a" * 501
  assert_not @recipe.valid?
end

test "description length should not be to short" do
@recipe.description = "a" * 19
  assert_not @recipe.valid?
end


end