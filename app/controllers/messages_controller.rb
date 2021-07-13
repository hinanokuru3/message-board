class MessagesController < ApplicationController
  def index
    @messages = Message.order(id: :desc).(params[:page]).per(3)
  end
    
  def show
    @message=Message.find(params[:id])
  end
  
   def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)

    if @message.save
      flash[:success] = 'Message が正常に投稿されました'
      redirect_to @message
    else
      flash.now[:danger] = 'Message が投稿されませんでした'
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  # Strong Parameter
  def message_params
    params.require(:message).permit(:content)
  end

end
