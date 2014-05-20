class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]

  def index
    @profiles = Profile.all
  end

  def show
  end

  def new
    @profile = Profile.new
  end

  def edit
  end

  def create
    @profile = Profile.new(profile_params)

      if @profile.save
        redirect_to @profile, notice: 'Profile was successfully created.'
      else
        render action: 'new'
      end
    end

  def update
      if @profile.update(profile_params)
        redirect_to @profile, notice: 'Profile was successfully updated.'
      else
        render action: 'edit'
      end
    end

  def destroy
    @profile.destroy
      redirect_to profiles_url, notice: 'Profile was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_params
      params.require(:profile).permit(:description)
    end
end
