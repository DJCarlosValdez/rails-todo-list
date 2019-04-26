class TodoListsController < ApplicationController
    before_action :set_todo_list, only: [:show, :edit, :update, :destroy]


    def index 
        @lists = TodoList.all
    end

    def new
        @list = TodoList.new
    end

    def create
        @list = TodoList.new(todo_list_params)
        
        respond_to do |format|
            if @list.save
              format.html { redirect_to @list, notice: 'Todo list was successfully created.' }
            else
              format.html { render :new }
            end
        end
    end
    
    def update 
        respond_to do |format|
            if @list.update(todo_list_params)
              format.html { redirect_to @list, notice: 'Todo list was successfully updated.' }
            else
              format.html { render :edit }
            end
        end
    end

    def destroy
        @list.destroy
    end

    def show
        
    end

    def edit    
    end
    
    private
    def set_todo_list
        @list = TodoList.find(params[:id])
    end
    
    def todo_list_params
        params.require(:todo_list).permit(:title, :description)
    end
    

end
