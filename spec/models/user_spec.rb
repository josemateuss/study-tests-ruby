# frozen_string_literal: true

require 'rails_helper'

describe User do
  it 'valid with name, email, phone and city' do
    user = User.new(name: 'Jhon Snow',
                    email: 'jhon@snow.com',
                    phone: '(61) 99999-8888',
                    city: 'Brasilia')
    expect(user).to be_valid
  end

  it 'invalid if already exists an equal email' do
    User.create(name: 'Jhon Snow',
                email: 'jhon@snow.com',
                phone: '(61) 99999-8888',
                city: 'Brasilia')

    user = User.new(name: 'Dominic Toretto',
                    email: 'jhon@snow.com',
                    phone: '(21) 99999-7777',
                    city: 'Rio de Janeiro')
    user.valid?
    expect(user.errors[:email]).to include('has already been taken')
  end

  it 'invalid when name is null' do
    user = User.new(name: nil)
    user.valid?
    expect(user.errors[:name]).to include("can't be blank")
  end

  # failed test example
  it 'invalid with another gender value' do
    user = User.new(name: 'Jhon Snow',
                    email: 'jhon@snow.com',
                    phone: '(61) 99999-8888',
                    city: 'Brasilia',
                    gender: 3)
    expect(user).to be_valid
    expect(user.errors[:gender]).to include('invalid value')
  end
end
