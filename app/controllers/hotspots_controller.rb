class HotspotsController < ApplicationController
  def index
	  @hotspots = Hotspot.all
   	  @hototal = Hotspot.sum(:price)
	  @hototald = Hotspot.sum(:debt)
	  @income = @hototal-@hototald
	  
  end

  def new
	  @hotspot = Hotspot.new
  end

  def create
	  @hotspot = Hotspot.new(params[:hotspot])
	  
	  respond_to do |format|
	  if @hotspot.save
		 format.html { redirect_to @hotspot, notice: 'Create success!' }
	  else
		  format.html { render action: "new"}
	  end
	  end

  end

  def show
	  @hotspot = Hotspot.find(params[:id])
  end

   def destroy
    if current_user
 	    @hotspot = Hotspot.find(params[:id])
	    @hotspot.destroy

           respond_to do |format|
   	   format.html { redirect_to hotspots_path }
   	   format.json { head :ok }
   	   end
    else
	    render text: "Sorry, no permission for you! Please Login or Signup first."
    end
  end

  def edit
  	@hotspot = Hotspot.find(params[:id])
  end

   def update
   	@hotspot = Hotspot.find(params[:id])

	respond_to do |format|
	if @hotspot.update_attributes(params[:hotspot])
		format.html { redirect_to @hotspot, notice: "Success updating"}
	else
		format.html { render action: "edit" }
	end
	end
   end

end
