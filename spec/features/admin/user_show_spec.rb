require 'rails_helper'

RSpec.describe 'User Show Page' do
  describe 'As an Admin' do
    before :each do
      @d_user = User.create(name: 'Scott', email: 'Scott@67.com', google_token: "MOCK_OMNIAUTH_GOOGLE_TOKEN_THREE", google_refresh_token: "MOCK_OMNIAUTH_GOOGLE_REFRESH TOKEN_THREE", uid: "100000000000000000003",  username: "Scott@67.com")
      @admin = User.create(name: 'Michelle', email: 'Michelle@67.com', google_token: "MOCK_OMNIAUTH_GOOGLE_TOKEN_TWO", google_refresh_token: "MOCK_OMNIAUTH_GOOGLE_REFRESH TOKEN_TWO", uid: "100000000000000000002",  username: "Michelle@67.com", role: 'admin')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)
    end

    it 'I see all info a user sees, without edit ability' do
      visit '/admin/users'

      click_link @d_user.name

      expect(current_path).to eq("/admin/users/#{@d_user.id}")
      expect(page).to have_content(@d_user.name)
      expect(page).to have_content(@d_user.role)
      expect(page).to have_content(@d_user.created_at)
      expect(page).to have_button("Delete")
      expect(page).to_not have_link('Edit')
    end

    it "I can delete a user" do
      visit "/admin/users/#{@d_user.id}"

      first(:button, "Delete").click

      expect(current_path).to eq("/admin/users/")
      expect(page).to have_content("The #{@d_user.name} account has been destroyed!")
      expect(page).to have_content(@admin.name)
      expect(page).to have_content(@admin.role)
      expect(page).to have_content(@admin.created_at)
    end

    it "I can delete a myself" do
      visit "/admin/users/#{@admin.id}"

      first(:button, "Delete").click

      expect(current_path).to eq("/")
      expect(page).to have_content("The #{@admin.name} account has been destroyed!")
    end
  end
end
