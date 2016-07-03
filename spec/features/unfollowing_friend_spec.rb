require "rails_helper"

RSpec.feature "follow friends" do

  before do
    @john = User.create(first_name: "john", last_name: "doe", email: "john@example.com", password: "password")
    @sarah = User.create(first_name: "sarah", last_name: "doe", email: "sarah@example.com", password: "password")


    login_as(@john)

    @following = Friendship.create(user: @john, friend: @sarah)
  end

  scenario "if signed in succeeds" do
    visit "/"

    click_link "My Lounge"

    link = "a[href='/friendships/#{@following.id}'][data-method='delete']"
    find(link).click

    expect(page).to have_content(@sarah.full_name + " unfollowed")

  end
end
