class RepliesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_reply, only: [:edit, :update, :show, :destroy]
  before_action :set_discussion, only: [:create, :edit, :update, :show, :destroy]


  def new
  end 

  def create
    @reply = @discussion.replies.create(reply_params)
    @reply.user_id = current_user.id

    respond_to do |format|
      if @reply.save
        format.html { redirect_to discussion_path(@discussion) }
        format.js #render create.js.erb
      else
        format.html { redirect_to discussion_path(@discussion), notice: 'Reply did not save. Please try again' }
        format.js #render create.js.erb
      end
    end
  end



  def destroy
    @reply = @discussion.replies.find(params[:id])
    @reply.destroy
    redirect_to discussion_path(@discussion)
  end

  def edit
    @discussion = Discussion.find(params[:discussion_id])
    @reply = @discussion.replies.find(params[:id])
  end

  def update
    @reply = @discussion.replies.find(params[:id])

    respond_to do |format|
      if @reply.update(reply_params)
        format.html { redirect_to discussion_path(@discussion), notice: 'Reply was updated' }
      else
        format.html { redirect_to discussion_path(@discussion), notice: 'Reply did not save. Please try again' }
        format.json { render json: @reply.errors, status: unprocessable_entity }
      end
    end
  end



  private

  def set_discussion
    @discussion = Discussion.find(params[:discussion_id])
  end

  def set_reply
    @reply = Reply.find(params[:id])
  end

  def reply_params
    params.require(:reply).permit(:reply, :user_id, :discussion_id)
  end

end