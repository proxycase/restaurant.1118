class Restaurant < ActiveRecord::Base
	def full_address
		"#{street} #{city} #{state} #{zip}"
	end
	def save
	    respond_to do |format|
	      if @restaurant.save
	        format.html { redirect_to @restaurant, notice: 'Restaurant was successfully created.' }
	        format.json { render :show, status: :created, location: @restaurant }
	      else
	        format.html { render :new }
	        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
	      end
	    end
	end
end
