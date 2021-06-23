# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'users/index', type: :view do
  before(:each) do
    assign(:users, [
             User.create!(
               name: 'Name',
               email: 'Email',
               phone: 'Phone',
               city: 'City'
             ),
             User.create!(
               name: 'Name',
               email: 'Email',
               phone: 'Phone',
               city: 'City'
             )
           ])
  end

  it 'renders a list of users' do
    render
    assert_select 'tr>td', text: 'Name'.to_s, count: 2
    assert_select 'tr>td', text: 'Email'.to_s, count: 2
    assert_select 'tr>td', text: 'Phone'.to_s, count: 2
    assert_select 'tr>td', text: 'City'.to_s, count: 2
  end
end
