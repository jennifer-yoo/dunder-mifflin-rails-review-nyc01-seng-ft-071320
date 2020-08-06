class DogsController < ApplicationController
  before_action :find_dog, only: [:show]

  def index

    @dogs = Dog.all.sort_by {|d| -d.employees.size}
    
  end

  def show
  end



private

def find_dog
  @dog = Dog.find(params[:id])
end



end
