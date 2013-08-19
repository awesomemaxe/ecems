class MsstudentsController < ApplicationController
  before_action :set_msstudent, only: [:show, :edit, :update, :destroy]

  def collection
    conditions = conditions_from_params
    @collection ||= end_of_association_chain.find(:all, :conditions => conditions)
  end
 
# Builds search conditions by search params for column names.
  def conditions_from_params
    conditions = nil
    params.reject {|key, value| [:controller, :action, :id].include?(key.to_sym)}.each do |key, value|
      next unless model.column_names.include?(key)
      if value.is_a?(Array)
        conditions = merge_conditions(conditions, ["#{model_name.to_s.pluralize}.#{key.to_s} in (?)", value])
      else
        conditions = merge_conditions(conditions, ["#{model_name.to_s.pluralize}.#{key.to_s} = ?", value])
      end
    end
    conditions
  end

  # GET /msstudents
  # GET /msstudents.json
  def index
    @msstudents = Msstudent.all
  end

  # GET /msstudents/1
  # GET /msstudents/1.json
  def show
  end

  # GET /msstudents/new
  def new
    @msstudent = Msstudent.new
  end

  # GET /msstudents/1/edit
  def edit
  end

  # POST /msstudents
  # POST /msstudents.json
  def create
    @msstudent = Msstudent.new(msstudent_params)

    respond_to do |format|
      if @msstudent.save
        format.html { redirect_to @msstudent, notice: 'msstudent was successfully created.' }
        format.json { render action: 'show', status: :created, location: @msstudent }
      else
        format.html { render action: 'new' }
        format.json { render json: @msstudent.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /msstudents/1
  # PATCH/PUT /msstudents/1.json
  def update
    @msstudent = Msstudent.find(params[:id])
    respond_to do |format|
      if @msstudent.update_attributes(params[:msstudent])
        format.html { redirect_to @msstudent, notice: ' Student was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @msstudent.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /msstudents/1
  # DELETE /msstudents/1.json
  def destroy
    @msstudent = Msstudent.find(params[:id])
    @msstudent.destroy

    respond_to do |format|
      format.html { redirect_to msstudents_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_msstudent
      @msstudent = Msstudent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def msstudent_params
      params.require(:msstudent).permit(:UID, :last_name, :first_name, :degree, :specialization, :cohort)
    end
end
