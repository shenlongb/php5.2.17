
# 说明文件

基于 TommyLau 版本，在此基础上加入 ZendOptimizer 3.3
适用 nginx

# 配置方式

phpfpm-server-5.2.17:
        image: registry.cn-hangzhou.aliyuncs.com/shenlongb/php5.2.17:1 
        expose:  
           - 9000 
        volumes: 
           - /app/docker_server/DOCKER_SERVER_CONF/php5.2.17-fpm/php.ini:/usr/local/etc/php/php.ini 

 
