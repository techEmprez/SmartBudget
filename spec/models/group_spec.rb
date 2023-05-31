require 'rails_helper'

RSpec.describe Group, type: :model do
  subject do
    Group.new({ name: 'Housing', icon: 'https://www.freepnglogos.com/uploads/dollar-sign-png/dollar-sign-finance-dollar-financial-world-image-pixabay-0.png',
                user_id: 1 })
  end

  before { subject.save }

  it 'Name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'icon should be present' do
    subject.icon = nil
    expect(subject).to_not be_valid
  end
end
