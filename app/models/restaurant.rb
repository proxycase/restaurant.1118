class Restaurant < ActiveRecord::Base
	def full_address
		"#{street} #{city} #{state} #{zip}"
	end
end
