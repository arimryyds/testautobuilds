# Dockerfile 学习实验
# 从基础镜像 centos 开始构建
FROM centos:latest
# 维护者信息
LABEL maintainer="2153418677@qq.com"
# 将 Dockerfile 上下文中 nginx.repo 复制到容器中的 yum 源定义文件位置
COPY ./nginx.repo /etc/yum.repos.d/

RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*

# 安装 Nginx
RUN yum install -y nginx
# 修改 Nginx 首页信息
RUN echo "Hello! This is nginx server " > /usr/share/nginx/html/index.html
# 对外暴露 80 端口
EXPOSE 80
# 启动 Ngxin
CMD ["nginx", "-g", "daemon off;"]
