require "rails_helper"

RSpec.feature "User sign out" do

  before do

    @john = User.create!(first_name: "john", last_name: "doe", email: "john@example", password: "password")

    visit "/"

    click_link "Sign in"
    fill_in "Email", with: @john.email
    fill_in "Password", with: @john.password
    click_button "Sign in"
  end

  scenario do
    visit "/"
    click_link "Sign out"
    expect(page).to have_content("Signed out successfully.")
  end
end
