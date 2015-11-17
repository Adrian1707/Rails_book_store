require 'spec_helper'

describe AuthorsController do 

	describe 'GET #index' do 
		
		it 'assigns the authors object to @authors variable' do 
			author1 = Fabricate(:author)
			author2 = Fabricate(:author)
			get :index 
			expect(assigns(:authors)).to match_array([author1, author2])
		end 

		it 'renders the index template' do 
			get :index 
			expect(response).to render_template :index 
		end

	end 

	describe 'GET #show' do 

		let(:author) { Fabricate(:author) }

		it 'finds the author with the given id and assigns it to @author variable' do 
			get :show, id: author
			expect(assigns(:author)).to eq(author) 
		end 

		it 'renders the show template' do 
			get :show, id: author 
			expect(response).to render_template :show 
		end 

	end 

	describe 'GET #new' do 
		
		it 'assigns a new author object to the @author variable' do 
			get :new 
			expect(assigns(:author)).to be_instance_of(Author)
		end

		it 'renders the new template' do 
			get :new 
			expect(response).to render_template :new
		end 

	end 

	describe 'POST #create' do 
		context 'a successful create' do 

			before do 
				post :create, author: Fabricate.attributes_for(:author) #attributes_for returns a hash instead of an object. 
			end
			
			it 'saves the new author object' do 
				# require 'pry';binding.pry
				expect(Author.count).to eq(1)
			end 

			it 'redirect to the show action' do 
				expect(response).to redirect_to author_path(Author.first)
			end 

			it 'sets the success flash message' do 
				expect(flash[:success]).to eq ("Author has been created")
			end 
		end 
		
		context 'an unsuccessful create' do 
			
			before do 
				post :create, author: Fabricate.attributes_for(:author, first_name: nil)
			end 

			it 'does not save the new author object with invalid inputs' do 
				expect(Author.count).to eq(0)
			end 
		
			it 'renders the new template' do 
				expect(response).to render_template :new
			end 

			it 'sets the failure flash message' do 
				expect(flash[:danger]).to eq ("Author has not been created")
			end 

		end 

	end 

	describe 'GET #edit' do
		let(:author) { Fabricate(:author) }

		it 'finds the author with the given id and assigns to @author variable' do 
			get :edit, id: author
			expect(assigns(:author)).to eq(author)
		end 

		it 'renders the edit template' do 
			get :edit, id: author
			expect(response).to render_template :edit

		end 

	end 


end 
