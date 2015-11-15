require 'spec_helper'

describe Author do 
	
	it 'requires a first name' do 
		author = Fabricate.build(:author, first_name: nil)
		expect(author).not_to be_valid
		expect(author.errors[:first_name].any?)
	end 


	it 'requires a last name' 
	describe "#fullname" do 
		it 'returns the full name of the author' do 

		end
	end 
end 