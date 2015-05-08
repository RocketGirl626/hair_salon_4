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

describe('viewing all of the stylists', {:type => :feature}) do
  it('allows a user to see all of the stylists that have been created') do
    stylist = Stylist.new({:name => 'Fifi', :id => nil})
    stylist.save()
    visit('/')
    click_link('Fifi')
    expect(page).to have_content(stylist.name)
  end
end
