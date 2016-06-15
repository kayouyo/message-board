class MessagesController < ApplicationController
  
  def index
    # Messageモデルのオブジェクトの初期化
    @message = Message.new
    # Messageを全て取得する。get all msgs
    @messages = Message.all
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      # msgが保存できた時 Message has been saved successfully
      redirect_to root_path , notice: 'Message has been saved successfully'
    else
      # msgが保存できなかった時 Failed to save the message
      @messages = Message.all
      flash.now[:alert] = "Failed to save the message"
      render 'index'
    end
  end

  private
  def message_params
    params.require(:message).permit(:name, :body)
  end
  ## ここまで
end
