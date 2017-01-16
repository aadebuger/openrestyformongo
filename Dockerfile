from  openresty/openresty:latest-trusty 
run /usr/local/openresty/luajit/bin/luarocks install md5
run /usr/local/openresty/luajit/bin/luarocks install lua-cjson
run /usr/local/openresty/luajit/bin/luarocks install net-url
#ARG RESTY_OPENSSL_VERSION="1.0.2h"

#run cd /tmp && curl -fSL https://www.openssl.org/source/openssl-${RESTY_OPENSSL_VERSION}.tar.gz -o openssl-${RESTY_OPENSSL_VERSION}.tar.gz \
# && tar xzf openssl-${RESTY_OPENSSL_VERSION}.tar.gz && cd openssl-${RESTY_OPENSSL_VERSION} && ./configure && make install
run apt-get update
run apt-get install -y libssl-dev
#run  /usr/local/openresty/luajit/bin/luarocks install luacrypto  OPENSSL_DIR=/tmp/openssl-${RESTY_OPENSSL_VERSION} 
run apt-get install -y cmake
run apt-get install -y git
run apt-get install -y  git-core automake autoconf libtool
run cd /tmp && git clone git://github.com/mongodb/libbson.git && cd libbson && ./autogen.sh && make && make install
run cd /tmp && git clone https://github.com/isage/lua-cbson
workdir /tmp/lua-cbson
run mkdir build && cd build && cmake .. && make && make install
run  /usr/local/openresty/luajit/bin/luarocks install luacrypto  
#run /usr/local/openresty/luajit/bin/luarocks install resty-mongol --server=http://rocks.moonscript.org 

run  /usr/local/openresty/luajit/bin/luarocks install  inspect 
run cd /tmp && git clone https://github.com/isage/lua-resty-moongoo && cd lua-resty-moongoo && cd lib && cp -r . /usr/local/openresty/luajit/share/luajit-2.1.0-beta2/ 
ENV LD_LIBRARY_PATH /usr/local/openresty/luajit/lib/:/usr/local/lib
run  /usr/local/openresty/luajit/bin/luarocks install luasocket 
run /usr/local/openresty/luajit/bin/luarocks install router
#/usr/local/openresty/luajit/share/luajit-2.1.0-beta2/
#add nginx.conf /usr/local/openresty/nginx/conf/
#add *.lua  /usr/local/openresty/nginx/conf/
