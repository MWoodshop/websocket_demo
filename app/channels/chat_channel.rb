class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'chat_channel'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def receive(data)
    send_message(data)
  end

  def send_message(data)
    ActionCable.server.broadcast 'chat_channel', data
  end
end
