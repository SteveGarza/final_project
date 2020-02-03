class Product < ActiveRecord::Base
  mount_uploader :image, ImageUploader

  belongs_to :category
  belongs_to :brand
end
