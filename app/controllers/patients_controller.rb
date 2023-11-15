require 'date'

class PatientsController < ApplicationController
    before_action :set_patient, only: [:show, :update, :destroy]

    
    # GET /patients
    def index
        @patients = PatientApi.all
        render json: { patients: @patients }
    end

    # POST /patients
    def create 
        @patient = PatientApi.new(patient_params)
        if @patient.save
            render json: { patient: @patient }, status: :created
        else
            render json: { errors: @patient.errors }, status: :unprocessable_entity
        end
    end

    # GET /patients/:id
    def show
        if @patient
         render json: { patient: @patient }
        else
            render json: { error: "Patient not found" }, status: :not_found
        end
    end

    # DELETE /patients/:id
    def destroy 
        @patient.destroy
        render json: "Patient deleted successfully!"
        head :no_content
    end

    # PUT /patients/:id
    def update  
        patient = PatientApi.find(params[:id])
        if @patient.update(patient_params)
            render json: { patient: @patient }
        else
            render json: { errors: @patient.errors }, status: :unprocessable_entity
        end
    end

    private
    
    def patient_params
        params.require(:patient).permit(:first_name, :last_name, :dob, :phone_number, :email, :middle_name, :ssn, :gender)
    end

    def set_patient
        @patient = PatientApi.find(params[:id])
    end
end