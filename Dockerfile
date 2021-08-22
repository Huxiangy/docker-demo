# 使用 node:6.10.3作为基础镜像
FROM node:6.10.3-slim

# 安装 nginx
RUN apt-get update \    && apt-get install -y nginx

# 指定工作目录
WORKDIR /app

# 将当前目录下的所有文件拷贝到工作目录下
COPY . /app/

# 声明运行时容器提供的服务端口
EXPOSE 80

# 
RUN  npm install \     && npm run build \     && cp -r dist/* /var/www/html \     && rm -rf /app

# 以前台方式启动nginx
CMD ["nginx","-g","daemon off;"]

