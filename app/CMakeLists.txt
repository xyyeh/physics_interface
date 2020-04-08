# use cmake 3 which supports targets
cmake_minimum_required(VERSION 3.1.3)

# project configuration
project(bullet_simulation_interface VERSION 0.1.0)

# setup executable
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/../bin")

# add source files
file(GLOB SRC_FILES ${CMAKE_CURRENT_SOURCE_DIR}/*.cc)

# add executable
add_executable(${PROJECT_NAME} ${SRC_FILES})

# compilation options
target_compile_features(${PROJECT_NAME} PRIVATE cxx_std_14)
target_compile_options(${PROJECT_NAME} PRIVATE -Werror)
set(CMAKE_VERBOSE_MAKEFILE ON)