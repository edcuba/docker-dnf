FROM fedora:27


RUN dnf install -y git-core dnf-plugins-core && git clone https://github.com/dmach/dnf && git clone https://github.com/edynox/libdnf
RUN cd dnf && git checkout origin/refactor-base-in-tests
RUN dnf copr enable -y rpmsoftwaremanagement/dnf-nightly
RUN dnf update -y
RUN dnf builddep -y libdnf/libdnf.spec
RUN dnf builddep -y dnf/dnf.spec
