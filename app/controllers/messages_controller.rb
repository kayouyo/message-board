class MessagesController < ApplicationController
  # 各アクションの前後に任意の処理を実行できる機能
  before_action :set_message, only: [:edit, :update, :destroy]
  
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
      # 次の画面で一度だけnoticeという値を設定する
      redirect_to root_path , notice: 'Message has been saved successfully'
    else
      # msgが保存できなかった時 Failed to save the message
      @messages = Message.all
      flash.now[:alert] = "Failed to save the message"
      render 'index'
    end
  end
  
  # Edit Message
  def edit
  end

  # Update Message
  def update
    if @message.update(message_params)
      # 保存に成功した場合はトップページへリダイレクト
      redirect_to root_path , notice: 'Content has been modified'
    else
      # 保存に失敗した場合は編集画面へ戻す
      render 'edit'
    end
  end
  
  # Delete Message  
  def destroy
    @message.destroy
    redirect_to root_path, notice: 'Content has been deleted'
  end

  private
  def message_params
    params.require(:message).permit(:name, :body)
  end
  
  def set_message
    @message = Message.find(params[:id])
  end
  ## ここまで
end
