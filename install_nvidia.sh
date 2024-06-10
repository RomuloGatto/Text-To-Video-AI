apk add sudo bash ca-certificates wget xz make gcc linux-headers 
wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub
wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.27-r0/glibc-2.27-r0.apk 
wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.27-r0/glibc-bin-2.27-r0.apk 
wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.27-r0/glibc-dev-2.27-r0.apk 
wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.27-r0/glibc-i18n-2.27-r0.apk 
apk add glibc-2.27-r0.apk glibc-bin-2.27-r0.apk glibc-dev-2.27-r0.apk glibc-i18n-2.27-r0.apk 
# apk add glibc-bin-2.27-r0.apk glibc-i18n-2.27-r0.apk glibc-2.27-r0.apk 
/usr/glibc-compat/bin/localedef -i en_US -f UTF-8 en_US.UTF-8 
bash NVIDIA-Linux-x86_64-390.77.run --check 
bash NVIDIA-Linux-x86_64-390.77.run --extract-only 
cd NVIDIA-Linux-x86_64-390.77 && ./nvidia-installer
