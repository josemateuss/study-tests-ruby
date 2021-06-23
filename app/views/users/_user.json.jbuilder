# frozen_string_literal: true

json.extract! user, :id, :name, :email, :phone, :city, :created_at, :updated_at
json.url user_url(user, format: :json)
