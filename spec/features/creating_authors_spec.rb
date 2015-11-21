require 'spec_helper'

feature 'Creating Authors' do 
	scenario 'create a valid author' do 
		visit root_path
		click_link 'Authors'
		click_link 'Add New author'
		fill_in "First name", with: "John"
		fill_in "Last name", with: "Bull"
		click_button 'Create Author'
		expect(page).to have_content('Author has been created')
	end

end 