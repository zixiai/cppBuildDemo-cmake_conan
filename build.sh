rm -rf build
mkdir -p build

rm -rf install
mkdir -p install

# 安装第三方依赖库
conan install . -of="./build/conan/Release" \
    -s build_type="Release" \
    -b missing \
    # -c tools.system.package_manager:mode=install \

# 配置和生成构建文件
cmake -S . -B build \
    -DCMAKE_TOOLCHAIN_FILE="./build/conan/Release/conan_toolchain.cmake" \
    -DCMAKE_BUILD_TYPE="Release" \
    -DCMAKE_INSTALL_PREFIX="install" \

# 构建项目
cmake --build build

# 安装
cmake --install build