class EmployeesController < ApplicationController
before_action :find_employee, only: [:show, :create, :edit, :update]

    def index
        @employees = Employee.all
    end

    def show
    end

    def new
        @employee = Employee.new
        @dogs = Dog.all
    end

    def create
        @employee = Employee.create(employee_params(:first_name, :last_name, :title, :office, :dog_id, :img_url))
        redirect_to employee_path(@employee)
    end

    def edit
        @dogs = Dog.all
    end

    def update
        @dogs = Dog.all
        @employee = Employee.update(employee_params(:title, :office, :dog_id, :img_url))
        redirect_to employee_path(@employee)
    end


    private

    def employee_params(*args)
        params.require(:employee).permit(*args)
    end

    def find_employee
        @employee = Employee.find(params[:id])
    end

end
