class Message < ActiveRecord::Base
  before_create :send_sms

private

  def send_sms
    begin
      response = RestClient::Request.new(
        :method => :post,
        :url => 'https://api.twilio.com/2010-04-01/Accounts/AC032a930f87c16f039f03517e32d6b7ff/Messages.json',
        :user => ENV['TWILIO_ACCOUNT_SID'],
        :password => ENV['TWILIO_AUTH_TOKEN'],
        :payload => { :Body => body,
                      :From => from,
                      :To => to }
      ).execute
    rescue
      throw(:abort)
    end
  end
end
