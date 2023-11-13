require 'date'

class PatientsApiController < ApplicationController
    before_action :set_patient, only: [:show, :update, :destroy]

    
    def index #Method that is called when index view is rendered
        @patients = PatientApi.all
        render json: @patients
    end

    def create # Method that is called when a patient is created
        @patient_api = PatientApi.new(patient_api_params)

        if @patient_api.save
            render json: @patient_api, status: :created
        else
            render json: @patient_api.errors, status: :unprocessable_entity
        end
    end

    def show # Method that is called when show view is rendered
        if @patient_api
         render json: @patient_api
        else
            render json: { error: "Patient not found" }, status: :not_found
        end
    end

    def destroy # Method that is called when a patient is deleted
        @patient_api.destroy
        render json: "Patient deleted successfully!"
        head :no_content
    end

    def update # Method that is called when a patient is updated
        patient_api = PatientApi.find(params[:id])
        if @patient_api.update(patient_api_params)
            render json: @patient_api
        else
            render json: @patient_api.errors, status: :unprocessable_entity
        end
    end

    private
    
    def patient_api_params
        params.require(:patient_api).permit(:first_name, :last_name, :dob, :phone_number, :address, :city, :state, :zip_code, :email)
    end

    def set_patient_api
        @patient_api = PatientApi.find(params[:id])
    end
end