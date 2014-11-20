class Board < ActiveRecord::Base
	has_many :pins
	belongs_to :user

	#validates_format_of :name, :with => /\A[a-zA-Z0-9]+\z/
end
