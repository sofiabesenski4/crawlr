class WebpagesController < ApplicationController
  before_action :set_webpage, only: %i[ show edit update destroy ]

  # GET /webpages or /webpages.json
  def index
    @webpages = Webpage.all
  end

  # GET /webpages/1 or /webpages/1.json
  def show
    # Button here that says start crawling..?


  end

  # GET /webpages/new
  def new
    @webpage = Webpage.new
  end

  # GET /webpages/1/edit
  def edit
  end

  # POST /webpages or /webpages.json
  def create
    @webpage = Webpage.new(webpage_params)

    respond_to do |format|
      if @webpage.save
        format.html { redirect_to webpage_url(@webpage), notice: "Webpage was successfully created." }
        format.json { render :show, status: :created, location: @webpage }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @webpage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /webpages/1 or /webpages/1.json
  def update
    respond_to do |format|
      if @webpage.update(webpage_params)
        format.html { redirect_to webpage_url(@webpage), notice: "Webpage was successfully updated." }
        format.json { render :show, status: :ok, location: @webpage }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @webpage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /webpages/1 or /webpages/1.json
  def destroy
    @webpage.destroy

    respond_to do |format|
      format.html { redirect_to webpages_url, notice: "Webpage was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def get_raw_html
    Net::HTTP.get(URI(@webpage.url)).force_encoding("UTF-8")
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_webpage
    @webpage = Webpage.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def webpage_params
    params.require(:webpage).permit(:url, :screenshot)
  end
end
