Given(/^I visit the signin page$/) do
  visit signin_path
end

When(/^I submit invalid signin information$/) do
  click_button "Sign in"
end

Then(/^I should see an error message$/) do
  expect(page).to have_selector('div.alert.alert-error')
end

Given(/^I have an account$/) do
  @user = User.create(name: "Example User", email: "user@example.com", password: "foobar", password_confirmation: "foobar")
end

When(/^I submit valid signin information$/) do
  fill_in "Email",    with: @user.email
  fill_in "Password", with: @user.password
  click_button "Sign in"
end

Then(/^I should see my profile page$/) do
  expect(page).to have_title(@user.name)
end

Then(/^I should see a signout link$/) do
  expect(page).to have_link('Sign out', href: signout_path)
end
