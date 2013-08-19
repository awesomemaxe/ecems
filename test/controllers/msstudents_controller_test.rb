require 'test_helper'

class MsstudentsControllerTest < ActionController::TestCase
  setup do
    @msstudent = msstudents(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:msstudents)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create msstudent" do
    assert_difference('msStudent.count') do
      post :create, msstudent: { UID: @msstudent.UID, cohort: @msstudent.cohort, degree: @msstudent.degree, first_name: @msstudent.first_name, last_name: @msstudent.last_name, specialization: @msstudent.specialization }
    end

    assert_redirected_to msstudent_path(assigns(:msstudent))
  end

  test "should show msstudent" do
    get :show, id: @msstudent
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @msstudent
    assert_response :success
  end

  test "should update msstudent" do
    patch :update, id: @msstudent, msstudent: { UID: @msstudent.UID, cohort: @msstudent.cohort, degree: @msstudent.degree, first_name: @msstudent.first_name, last_name: @msstudent.last_name, specialization: @msstudent.specialization }
    assert_redirected_to msstudent_path(assigns(:msstudent))
  end

  test "should destroy msstudent" do
    assert_difference('msStudent.count', -1) do
      delete :destroy, id: @msstudent
    end

    assert_redirected_to msstudents_path
  end
end
