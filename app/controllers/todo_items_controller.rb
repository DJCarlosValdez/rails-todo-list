class TodoItemsController < ApplicationController
    before_action :set_todo_list
    before_action :set_todo_item, except: [:create]


    def create
        @item = @list.todo_items.create(todo_item_params)
        redirect_to @list
    end

    def destroy
        @item = @list.todo_items.find(params[:id])
        if @item.destroy
            flash[:success] = "Todo List item was deleted."
        else
            flash[:error] = "Todo List item could not be deleted."
        end
        redirect_to @list
    end

    def complete
        if @item.completed_at == nil
            @item.update_attribute(:completed_at, Time.now)
            redirect_to @list, notice: "Todo item completed"
        elsif @item.completed_at
            @item.update_attribute(:completed_at, "restored")
            redirect_to @list, notice: "Todo item restored to incompleted"
        end
    end

    private

    def set_todo_list
        @list = TodoList.find(params[:todo_list_id])
    end

    def todo_item_params
        params[:todo_item].permit(:content)
    end

    def set_todo_item
        @item = @list.todo_items.find(params[:id])
    end

end
