# frozen_string_literal: true

class User < ActiveRecord::Base
  enum gender: { male: 0, female: 1, uninformed: 2 }

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :phone, presence: true
  validates :city, presence: true
  validates :gender, presence: false
end
