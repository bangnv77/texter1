class Message < ActiveRecord::Base
  before_create :send_sms

private

  def send_sms
    response = RestClient::Request.new(
      :method => :post,
      :url => 'https://api.twilio.com/2010-04-01/Accounts/AC032a930f87c16f039f03517e32d6b7ff/Messages.json',
      :user => 'AC032a930f87c16f039f03517e32d6b7ff',
      :password => '072c3217d4934875a75e1ed192c68c97',
      :payload => { :Body => body,
                    :From => from,
                    :To => to }
    ).execute
  end
end
