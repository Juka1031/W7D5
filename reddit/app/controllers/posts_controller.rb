class PostsController < ApplicationController

    def new
        @post = Post.new
        render :new
    end

    def create
        @post = Post.new(posts_params)
        if @post.save
            redirect_to post_url(@post)
        else
            flash.now[:errors] = ["Incorrect post style"]
            render :new
        end
    end


    def show
        @post = Post.find_by(id: params[:id])
        render :show
    end

    def edit
        @post = Post.find(params[:id])
        render :edit
    end

    def update
        @post = Post.find(params[:id])

        if @post.update(posts_params)
            
            redirect_to post_url(@post)
        else
            flash.now[:errors] = ["Update not successful"]
        end

    end

    private
    def posts_params 
        params.require(:post).permit(:title, :url, :content, :sub_id, :author_id)
    end

end