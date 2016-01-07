require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase

	def setup
		@sitle = "Ruby on Rails Tutorial Sample App"
	end


  test "should get home" do
    get :home
    assert_response :success
    assert_select "title", "Home | #{@sitle}"

  end

  test "should get help" do
    post :help
    assert_response :success
    assert_select "title", "Help | #{@sitle}"
  end

   test "should get about" do
    post :about
    assert_response :success
    assert_select "title", "About | #{@sitle}"
  end

    test "should get contact" do
    post :contact
    assert_response :success
    assert_select "title", "Contact | #{@sitle}"

  end


end
