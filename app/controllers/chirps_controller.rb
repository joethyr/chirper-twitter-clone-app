class ChirpsController < ApplicationController
  load_and_authorize_resource
  before_action :set_chirp, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index]

  # GET /chirps or /chirps.json
  def index
    @chirps = Chirp.all.order("created_at DESC")
    @chirp = Chirp.new
  end

  # GET /chirps/1 or /chirps/1.json
  def show
  end

  # GET /chirps/new
  def new
    @chirp = current_user.chirps.build
  end

  # GET /chirps/1/edit
  def edit
  end

  # POST /chirps or /chirps.json
  def create
    @chirp = current_user.chirps.build(chirp_params)
    @chirp.user_id = current_user.id

    respond_to do |format|
      if @chirp.save
        format.html { redirect_to root_path, notice: "Chirp was successfully created." }
        format.json { render :show, status: :created, location: @chirp }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @chirp.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chirps/1 or /chirps/1.json
  def update
    respond_to do |format|
      if @chirp.update(chirp_params)
        format.html { redirect_to chirp_url(@chirp), notice: "Chirp was successfully updated." }
        format.json { render :show, status: :ok, location: @chirp }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @chirp.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chirps/1 or /chirps/1.json
  def destroy
    @chirp.destroy

    respond_to do |format|
      format.html { redirect_to chirps_url, notice: "Chirp was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chirp
      @chirp = Chirp.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def chirp_params
      params.require(:chirp).permit(:chirp)
    end
end
