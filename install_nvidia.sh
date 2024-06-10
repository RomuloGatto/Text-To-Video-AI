apk add sudo bash ca-certificates wget xz make gcc linux-headers 
apk add alpine-baselayout=3.2.0-r22
wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub
wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.35-r1/glibc-2.35-r1.apk 
wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.35-r1/glibc-bin-2.35-r1.apk 
wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.35-r1/glibc-dev-2.35-r1.apk 
wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.35-r1/glibc-i18n-2.35-r1.apk 
apk add glibc-2.35-r1.apk glibc-bin-2.35-r1.apk glibc-dev-2.35-r1.apk glibc-i18n-2.35-r1.apk --force-overwrite 
/usr/glibc-compat/bin/localedef -i en_US -f UTF-8 en_US.UTF-8 
wget http://us.download.nvidia.com/XFree86/Linux-x86_64/390.77/NVIDIA-Linux-x86_64-390.77.run
chmod +x NVIDIA-Linux-x86_64-390.77.run
bash NVIDIA-Linux-x86_64-390.77.run --check 
bash NVIDIA-Linux-x86_64-390.77.run --extract-only 
cd NVIDIA-Linux-x86_64-390.77 && ./nvidia-installer
