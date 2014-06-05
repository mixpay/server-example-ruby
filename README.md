server-example-ruby
===================

聚易付服务器端示例-Ruby版

# 需求

1. Ruby运行环境
2. OpenSSL

# 准备

### 生成RSA密钥

使用OpenSSL生成RSA公钥和私钥文件

```
openssl genrsa -out rsa_private_key.pem 1024
openssl rsa -in rsa_private_key.pem -pubout -out rsa_public_key.pem
```

### 安装Sinatra

用bundle安装

```
bundle install
```
或者直接安装

```
gem install sinatra
```

#使用

### 启动Sinatra Http Server

```
ruby server -o 监听IP -p 端口
```

例如

```
ruby server -o 0.0.0.0 -p 4567
```

### 访问签名服务

```
http://ip:4567/sign?param1=value1&param2＝value2
```

即可得到param1=value1&param2＝value2的RSA数字签名（已经过urlencode）

