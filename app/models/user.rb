class User < ActiveRecord::Base
	has_many :boards
	has_many :pins

	validates :name, :about, presence: true
	validates :name, length: { in: 2...12 }
	validates :name, length: { in: 2..12 }
	validates :name, length: { minimum: 2, maximum: 12}
	validates :name, length: { maximum: 15 }

	#do not require data in about field
	validates :about, presense: false  

end
