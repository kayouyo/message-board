class MessagesController < ApplicationController
  
  def index
    # Messageモデルのオブジェクトの初期化
    @message = Message.new
    # Messageを全て取得する。get all msgs
    @messages = Message.all
  end

  def create
    @message = Message.new(message_params)
    @message.save
    redirect_to root_path , notice: 'Message has been saved successfully!'
  end

  private
  def message_params
    params.require(:message).permit(:name, :body)
  end
  ## ここまで
end
