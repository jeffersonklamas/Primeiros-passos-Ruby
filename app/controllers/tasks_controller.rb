class TasksController < ApplicationController
    def new
    end
    def create
        puts params
    end
    def create
        # @task = Task.new(description: params[:task][:description], status: params[:task][:status])
        @task = Task.new(params.require(:task).permit(:description, :status))       
        @task.save #salve no banco a tarefa que criamos
        redirect_to root_path # Viu como o root é importante
    end
    def edit
        @task = Task.find(params[:id])
    end

    def update
        @task = Task.find(params[:id])
        @task.update(params.require(:task).permit(:description, :status))
        redirect_to root_path
    end

    def destroy
        task = Task.find(params[:id])
        task.destroy
        redirect_to root_path
    end
end