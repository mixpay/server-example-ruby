require "openssl"
require "base64"

module Mixpay
  class Signature

    class << self 

      #将参数转换为符合规则的待签名字符串
      def raw_string(params)
        raw_str = params.sort.collect{|s| [s[0],s[1]].join("=")}.join("&")
        puts "raw string: #{raw_str}"
        return raw_str
      end

      #对content字符串签名
      #1. 签名
      #2. 对签名结果做Base64编码
      #3. 对Base64编码做UrlEncoding
      def sign(content, private_key)
        sign = private_key.sign("sha1", content.force_encoding("utf-8"))
        sign_64 = Base64.encode64(sign).gsub(/\n/, '')
        sign_encoded = URI.encode_www_form_component(sign_64)
        return "#{sign_encoded}"
      end

      #用公钥验证签名
      def varify_sign(content, sign, public_key)
        is_sign_valid = public_key.verify("sha1", sign, content.force_encoding("utf-8"))
        puts "verify #{is_sign_valid ? 'success!' : 'fail!'}"
        return is_sign_valid
      end

    end
  end
end