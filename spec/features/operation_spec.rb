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

  it 'should be able to see exchanges' do
    click_on 'Housing'
    expect(page).to have_content('Add Transaction')
  end

  it 'should be able to redirect to add new trasaction' do
    click_on 'Housing'
    click_on 'Add Transaction'
    expect(page).to have_content('You can choose one or more categories')
  end

  it 'should be able to save transaction' do
    click_on 'Housing'
    click_on 'Add Transaction'
    fill_in 'Transaction name', with: 'Housing'
    fill_in 'Amount', with: 5
    select 'Housing'
    click_on 'Create Transaction'
    expect(page).to have_content('Housing')
  end
end
