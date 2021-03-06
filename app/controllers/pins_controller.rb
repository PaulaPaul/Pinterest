class PinsController < ApplicationController
  before_action :set_pin, only: [:show, :edit, :update, :destroy]

  # GET /pins
  # GET /pins.json
  def index
    @pins = Pin.all
  end

  # GET /pins/1
  # GET /pins/1.json
  def show
    @user = User.all
    @boards = Board.all 
  end

  #TODO: figure out how to add a 'pin_it' method on a pin to create a copy on my own board
  #      would be something like calling newpin = Pin.new(name,about,image) with the current pin
  #      info, to make a copy of the current pin and add it to the current user

  # GET /pins/new
  def new
    @pin = Pin.new
    # when adding a new pin, you need to specify which board it belongs to
    # TODO: need to figure out how to have the new pin user_id set to the board.user.id when created?
    @boards = Board.all
  end

  # GET /pins/1/edit
  def edit
    # when editing a pin, you need to specify which board it belongs to
    @user = User.all
    @boards = Board.all
  end

  # POST /pins
  # POST /pins.json
  def create
    @pin = Pin.new(pin_params)

    respond_to do |format|
      if @pin.save
        format.html { redirect_to @pin, notice: 'Pin was successfully created.' }
        format.json { render :show, status: :created, location: @pin }
      else
        format.html { render :new }
        format.json { render json: @pin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pins/1
  # PATCH/PUT /pins/1.json
  def update
    respond_to do |format|
      if @pin.update(pin_params)
        format.html { redirect_to @pin, notice: 'Pin was successfully updated.' }
        format.json { render :show, status: :ok, location: @pin }
      else
        format.html { render :edit }
        format.json { render json: @pin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pins/1
  # DELETE /pins/1.json
  def destroy
    @pin.destroy
    respond_to do |format|
      format.html { redirect_to pins_url, notice: 'Pin was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pin
      @pin = Pin.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pin_params
      params.require(:pin).permit(:name, :about, :board_id)
    end
end
