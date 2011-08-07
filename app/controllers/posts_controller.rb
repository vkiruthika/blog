class PostsController < ApplicationController
def index
  @posts = Post.all
end

def new
 @post = Post.new

end

def create
 @post = Post.new(params[:post])
 if(@post.save)
   redirect_to @post, :notice =>"post created successfully"
 else
   render :action=>:new
 end
end

def show
  @post = Post.find(params[:id])
  @comment = @post.comments.build
end

def edit
  @post = Post.find(params[:id])
end

def update
  @post = Post.find(params[:id])
  if(@post.update_attributes(params[:post]))
    redirect_to @post
  else
    render :action=>:edit
    end  
end

def destroy
  @post = Post.find(params[:id])
  @post.destroy
  redirect_to posts_path, :notice =>"post now has been deleted"
  
end
end
