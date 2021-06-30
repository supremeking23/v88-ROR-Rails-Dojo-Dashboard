class Dojo < ApplicationRecord
    validates :branch, :street, :city, :state , presence: true
end
