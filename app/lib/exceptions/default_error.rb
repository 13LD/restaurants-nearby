module Exceptions
  class DefaultError < StandardError
    attr_reader :message

    def initialize(msg = "알 수 없는 에러가 발생했습니다.", notification = false)
      @message = msg
      puts "DefaultError => #{msg}" if Rails.env.development?
      SlackService.send_message("Exceptions::DefaultError", msg, :error) if notification
    end
  end
end
