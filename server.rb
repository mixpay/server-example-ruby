require 'sinatra'
require File.dirname(__FILE__) + '/signature.rb'

post '/sign' do
  puts params

  private_key = OpenSSL::PKey::RSA.new(File.read("rsa_private_key.pem"))
  #public_key = OpenSSL::PKey::RSA.new(File.read("rsa_public_key.pem"))

  app_key = params[:app_key]

  content = Mixpay::Signature.raw_string(params)
  sign = Mixpay::Signature.sign(content, private_key)

  #Mixpay::Signature.varify_sign(content, sign, public_key)
  return sign
end

post '/notify' do
  puts params

  #todo: 订单处理逻辑

  return "success"
  #return "fail"
end