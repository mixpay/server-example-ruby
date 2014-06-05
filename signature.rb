require "openssl"
require "base64"

module Mixpay
  class Signature

    class << self 
      def sign(content, private_key)
        sign = private_key.sign("sha1", content.force_encoding("utf-8"))
        sign64 = Base64.encode64(sign).gsub(/\n/, '')
        return "#{sign64}"
      end

      def varify_sign(content, sign, public_key)
        public_key.verify("sha1", sign, content.force_encoding("utf-8"))
      end

      def row_string(params)
        params.sort.collect{|s| [s[0],s[1]].join("=")}.join("&")
      end

      def row_string_with_quote(params)
        params.sort.collect{|p| "#{p[0]}=\"#{p[1]}\""}.join("&")
      end

    end
  end
end
