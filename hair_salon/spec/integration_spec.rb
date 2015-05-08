require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('adding a new stylist', {:type => :feature}) do
  it('allows a user to add a stylist to the database') do
    visit('/')
    fill_in('name', :with =>'Pierre')
    click_button('Add Stylist')
    expect(page).to have_content('Pierre')
  end
end
