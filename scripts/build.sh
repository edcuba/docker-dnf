rm -rf build-dnf
rm -rf build-libdnf

set -e
mkdir -p build-dnf
mkdir -p build-libdnf

# LIBDNF
cd build-libdnf
cmake -DPYTHON_DESIRED=3 ../libdnf
ln -s python bindings/libdnf
touch bindings/libdnf/__init__.py
make -j2
make install

# DNF
cd ../build-dnf
cmake -DPYTHON_DESIRED=3 ../dnf
make -j2
