# frozen_string_literal: true

class Ingredient < ApplicationRecord
  has_many :doses
  has_many :cocktails, through: :doses
  validates :name, presence: true, uniqueness: true
  before_destroy :check_doses

  private

  def check_doses
    return if doses.empty?

    raise ActiveRecord::InvalidForeignKey
  end
end
