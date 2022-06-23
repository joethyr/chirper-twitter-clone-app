require "application_system_test_case"

class ChirpsTest < ApplicationSystemTestCase
  setup do
    @chirp = chirps(:one)
  end

  test "visiting the index" do
    visit chirps_url
    assert_selector "h1", text: "Chirps"
  end

  test "should create chirp" do
    visit chirps_url
    click_on "New chirp"

    fill_in "Chirp", with: @chirp.chirp
    click_on "Create Chirp"

    assert_text "Chirp was successfully created"
    click_on "Back"
  end

  test "should update Chirp" do
    visit chirp_url(@chirp)
    click_on "Edit this chirp", match: :first

    fill_in "Chirp", with: @chirp.chirp
    click_on "Update Chirp"

    assert_text "Chirp was successfully updated"
    click_on "Back"
  end

  test "should destroy Chirp" do
    visit chirp_url(@chirp)
    click_on "Destroy this chirp", match: :first

    assert_text "Chirp was successfully destroyed"
  end
end
