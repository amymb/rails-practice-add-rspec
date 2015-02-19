require 'rails_helper'
feature 'Events' do

  scenario 'User creates an event' do
    visit root_path
    click_on 'New Event'
    fill_in 'Description', with: 'Fun Party!'
    click_on 'Create Event'
    expect(page).to have_content('Fun Party!')
  end

  scenario 'User can visit an event he or she creates' do
    Event.create!(
      description: 'butter churning',
      location: 'France'
    )
    visit root_path
    click_on 'butter churning'

    expect(page).to have_content('France')
  end



  scenario 'User edits an event' do
    Event.create!(
      description: 'My aweeesome event'
    )

    visit root_path
    expect(page).to have_content('My aweeesome event')
    click_on 'edit'
    fill_in 'Description', with: 'My awesome event'
    click_on 'Update Event'

    expect(page).to have_content('My awesome event')
    expect(page).to have_no_content('My aweeesome event')
  end

  scenario 'User can delete an event' do
    Event.create!(
      description: 'Worst event ever. Should probably be destroyed'
    )
    visit root_path
    expect(page).to have_content('Worst event ever. Should probably be destroyed')
    click_on 'delete'
    expect(page).to have_no_content('Worst event ever. Should probably be destroyed')
  end

end
