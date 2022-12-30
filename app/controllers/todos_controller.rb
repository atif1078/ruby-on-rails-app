class TodosController < ApplicationController
    before_action :set_todo, only: %i[edit update destroy show]

    def index
        @todos = Todo.all
    end

    def new
        @todo = Todo.new
    end

    def create
        @todo = Todo.new(todo_params)

        if @todo.save!
            redirect_to root_path
        else
            render :new
        end
    end

    def update
        if @todo.update(todo_params)
            redirect_to root_path
        else
            render :edit
        end
    end

    def destroy
        if @todo.destroy
            redirect_to root_path
        else
            render :show
        end
    end

    def delete_completed
        Todo.where(status: 1).destroy_all
        redirect_to root_path
    end

    private

    def todo_params
        params.require(:todo).permit(:title, :description, :status)
    end

    def set_todo
        @todo = Todo.find(params[:id])
    end
end
