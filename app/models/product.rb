class Product < ActiveRecord::Base
  attr_accessible :description, :name, :pricing

  validates :description, :name, :pricing, presence: true
  validates :pricing, numericality: true
end
