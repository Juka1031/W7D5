class SubsController < ApplicationController

    def new
        render :new
    end

    def create
        @sub = Sub.new(subs_params)
        if @sub.save
            redirect_to subs_url
        else
            flash.now[:errors] = ["Incorrect sub style"]
            render :new
        end
    end

    def index
        @subs = Sub.all
        render :index
    end

    def show
        @sub = Sub.find_by(id: params[:id])
        render :show
    end

    def edit
        @sub = Sub.find(params[:id])
        render :edit
    end

    def update
        @sub = Sub.find(params[:id])

        if @sub.update(subs_params)
            redirect_to sub_url(@sub)
        else
            flash.now[:errors] = ["Update not successful"]
        end

    end

    private
    def subs_params 
        params.require(:sub).permit(:title, :description, :moderator_id)
    end

end