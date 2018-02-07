FROM fedora:27

COPY scripts/build.sh /root/build.sh
COPY scripts/dnf.sh /root/dnf.sh

RUN dnf install -y git-core dnf-plugins-core vim valgrind && git clone https://github.com/rpm-software-management/dnf && git clone https://github.com/edynox/libdnf
RUN cd dnf && git checkout origin/wip/swdb
RUN dnf update -y
RUN dnf copr enable -y rpmsoftwaremanagement/dnf-nightly
RUN dnf builddep -y libdnf/libdnf.spec
RUN dnf builddep -y dnf/dnf.spec
