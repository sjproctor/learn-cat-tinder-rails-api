require 'rails_helper'

RSpec.describe "Cats", type: :request do
  describe 'GET #index' do
    it 'returns http success' do
      get cats_path
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST #create' do
    it 'creates a valid cat' do
      post cats_path, params: { 
        cat: { 
          name: 'Test Cat for post request', 
          age: 5, 
          enjoys: 'Test for enjoys attribute', 
          image: 'https://images.unsplash.com/photo-1526336024174-e58f5cdd8e13?q=80&w=3387&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D' 
        } 
      }
      cat = Cat.where(name: 'Test Cat for post request').first
      expect(cat.valid?).to eq(true)
      expect(response).to have_http_status(200)
    end
    it 'creates a invalid cat' do
      post cats_path, params: { 
        cat: { 
          name: nil, 
          age: nil, 
          enjoys: nil, 
          image: nil 
        } 
      }
      cat = Cat.where(name: nil).first
      expect(cat).to eq(nil)
      expect(response).to have_http_status(422)
    end
  end

  describe 'PATCH #update' do
    it 'valid updates for cat' do
      cat = Cat.create(
        name: 'Test Cat', 
        age: 5, 
        enjoys: 'Test for enjoys attribute', 
        image: 'https://images.unsplash.com/photo-1526336024174-e58f5cdd8e13?q=80&w=3387&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
      )
      patch cat_path(cat), params: { 
        cat: { 
          name: 'Test Cat for patch request', 
          age: 6, 
          enjoys: 'Test for enjoys attribute for patch request', 
          image: 'https://images.unsplash.com/photo-1548546738-8509cb246ed3?q=80&w=3181&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
        } 
      }
      cat = Cat.where(name: 'Test Cat for patch request').first
      expect(cat.name).to eq('Test Cat for patch request')
      expect(cat.age).to eq(6)
      expect(cat.enjoys).to eq('Test for enjoys attribute for patch request')
      expect(cat.image).to eq('https://images.unsplash.com/photo-1548546738-8509cb246ed3?q=80&w=3181&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D')
      expect(response).to have_http_status(200)
    end
    it 'invalid updates for cat' do
      cat = Cat.create(
        name: 'Test Cat', 
        age: 5, 
        enjoys: 'Test for enjoys attribute', 
        image: 'https://images.unsplash.com/photo-1526336024174-e58f5cdd8e13?q=80&w=3387&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
      )
      patch cat_path(cat), params: { 
        cat: { 
          name: nil, 
          age: nil, 
          enjoys: nil, 
          image: nil
        } 
      }
      cat = Cat.where(name: nil).first
      expect(cat).to eq(nil)
      expect(response).to have_http_status(422)
    end
  end

  describe 'DELETE #destroy' do
    it 'deletes the cat' do
      cat = Cat.create(
        name: 'Test Cat for delete request', 
        age: 5, 
        enjoys: 'Test for enjoys attribute', 
        image: 'https://images.unsplash.com/photo-1526336024174-e58f5cdd8e13?q=80&w=3387&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
      )
      delete cat_path(cat)
      cat = Cat.where(name: 'Test Cat for delete request').first
      expect(cat).to eq(nil)
      expect(response).to have_http_status(204)
    end
  end
end
