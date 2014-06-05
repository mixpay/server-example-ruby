require 'sinatra'
require 'uri'
require File.dirname(__FILE__) + '/signature.rb'

get '/sign' do
  puts params
  app_key = params[:app_key]  

  private_key = OpenSSL::PKey::RSA.new(File.read("rsa_private_key.pem"))

  content = Mixpay::Signature.row_string(params)

  raw_sign = Mixpay::Signature.sign(content, private_key)

  encoded_sign = URI.encode_www_form_component(raw_sign)
  puts raw_sign
  puts encoded_sign
  return encoded_sign
end


post '/notify' do
  puts params

  #TODO: 订单处理逻辑
  
  return "success"
end
