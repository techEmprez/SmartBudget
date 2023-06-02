require 'rails_helper'

RSpec.describe 'Operation page', type: :feature do
  before :each do
    @user1 = User.new({ name: 'techEmprez', email: 'choiceosobor@gmail.com', password: 'Snazzy',
                        password_confirmation: 'Snazzy' })
    @category = Group.create({ name: 'Housing',
                               icon: 'https://www.freepnglogos.com/uploads/dollar-sign-png/dollar-sign-finance-dollar-financial-world-image-pixabay-0.png',
                               user_id: @user1.id })
    visit user_session_path
    fill_in 'Email', with: @user1.email
    fill_in 'Password', with: @user1.password
    click_button 'Log in'
  end
end
