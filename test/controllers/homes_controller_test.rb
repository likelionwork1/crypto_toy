require 'test_helper'

class HomesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get homes_index_url
    assert_response :success
  end

  test "should get second" do
    get homes_second_url
    assert_response :success
  end

  test "should get third" do
    get homes_third_url
    assert_response :success
  end

end
