# eclipse by Docker

###### by:小帽

### init：

```sh
git clone https://github.com/yikongge/ubteclipse.git
cd ubteclipse
docker build -t halfeclipse ./file/
chmod +x kali.sh
ln -s kali.sh /usr/bin/kali

docker run -v /tmp/.X11-unix/X0:/tmp/.X11-unix/X0 -v ~/eclipse-workspace:/root/eclipse-workspace --restart=always -e DISPLAY=unix$DISPLAY -e GDK_SCALE -e GDK_DPI_SCALE -P -it --name eclipse halfeclipse /bin/bash

```

执行命令打开eclipse安装器

/opt/eclipse-installer/eclipse-inst

安装eclipse javaEE，

后面的操作就有很多种了，自己选择好了，比如再打包成镜像然后每次启动容器自动打开eclipse；或者容器不再打包，用时执行在容器执行/root/eclipse/jee-2019-12命令打开eclipse就可以了

### 另:

~~可能Dockerfile里不需要安qt系列，懒得试了。~~

Dockerfile里没有换apt源，需要换请打开COPY的注释