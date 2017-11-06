class ApplicationFormController < ApplicationController
    
    def index
       @application_forms = Application_form.all
    end
    
    
    def show
        @application_form = Application_form.find(params[:id])
    end
    
    
    def new
        @application_form = Application_form.new
    end
    
    
    def create
        @application_form = Application_form.new(application_form_params)
        
        if @application_form.save
            redirect_to @appllication_form, notice: "Your Application Form was saved successfully."
        else
           flash.now[:alert] = "Error creating your application. Please try again."
           render :new
        end            
    end
    
    
    def edit
        @application_form = Application_form.find(params[:id])   
    end
    
    def update 
        @application_form = Application_form.find(params[:id])
        @application_form.assign_attributes(application_form_params)
        
        if @application_form.save
            flash[:notice] = "Application was updated successfully."
            redirect_to @application_form
        else
           flash.now[:alert] = "Error saving your application. Please try again."
           render :edit
        end
    end
    
    def destroy
        @application_form = Application_form.find(params[:id]) 
        
        if @application_form.destroy
           flash[:notice] = "\"#{@application_form.name}\" was deleted successfully."
           redirect_to action: :index
         else
           flash.now[:alert] = "There was an error deleting the application."
           render :show
        end
    end
    
    
    private
    def application_form_params
        params.require(:application_form).permit(:name, :description)
    end
end
