class Item < ApplicationRecord
  validates_presence_of :title, :date, :description
end
