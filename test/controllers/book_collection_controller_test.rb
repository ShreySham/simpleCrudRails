require 'test_helper'

class BookCollectionControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get book_collection_index_url
    assert_response :success
  end

  test "should get addBook" do
    get book_collection_addBook_url
    assert_response :success
  end

  test "should get updateBook" do
    get book_collection_updateBook_url
    assert_response :success
  end

  test "should get details" do
    get book_collection_details_url
    assert_response :success
  end

  test "should get delete" do
    get book_collection_delete_url
    assert_response :success
  end

end
