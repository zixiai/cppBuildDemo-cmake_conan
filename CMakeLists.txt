# ----------------------------------------------------------------------------
# Root CMake file for cppManagement
# ----------------------------------------------------------------------------
# 设置CMake的最低版本要求
cmake_minimum_required(VERSION 3.10)

# 定义项目名称
project(cppManagement)

# ----------------------------------------------------------------------------
# 定义可执行文件
# ----------------------------------------------------------------------------
add_executable(${PROJECT_NAME})

# ----------------------------------------------------------------------------
# 搜集源代码文件
# ----------------------------------------------------------------------------
aux_source_directory(${CMAKE_CURRENT_SOURCE_DIR}/src SRCS)

target_sources(${PROJECT_NAME}
    PRIVATE
    ${SRCS}
)

message("===================================")
string(REPLACE ";" "\n" SRCS_WITH_NEWLINES "${SRCS}")
message("source:")
message(${SRCS_WITH_NEWLINES})
message("===================================\n")

# ----------------------------------------------------------------------------
# 设置项目头文件目录
# ----------------------------------------------------------------------------
target_include_directories(${PROJECT_NAME}
    PRIVATE
    ${CMAKE_CURRENT_SOURCE_DIR}/src
)

# ----------------------------------------------------------------------------
# 链接所需的库
# ----------------------------------------------------------------------------
find_package(Boost REQUIRED)
target_link_libraries(${PROJECT_NAME} PRIVATE boost::boost)

find_package(OpenCV REQUIRED)
target_link_libraries(${PROJECT_NAME} PRIVATE ${OpenCV_LIBS})


# ----------------------------------------------------------------------------
# 安装
# ----------------------------------------------------------------------------
install(TARGETS ${PROJECT_NAME}
    RUNTIME DESTINATION ${PROJECT_NAME}  # 设置可执行文件的安装目录
)