# use cmake 3 which supports targets
cmake_minimum_required(VERSION 3.1.3)

# ===== PROJECT CONFIG =====
project(BubExampleApp)

# ===== SETUP EXECUTABLE =====
# set where the executable is built
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/../bin")

# ===== CREATE EXECUTABLE FROM SOURCE =====
	
# Add source files
file(GLOB SRC_FILES ${CMAKE_CURRENT_SOURCE_DIR}/*.cpp)

# Create executable
add_executable(${PROJECT_NAME} ${SRC_FILES})

# ===== LINK DEPENDENCIES ======
#if(USE_SYSTEM_BULLET)
find_package(Bullet HINTS ${CMAKE_INSTALL_PREFIX})
include_directories(${BULLET_INCLUDE_DIR})
target_link_libraries(${PROJECT_NAME} ${BULLET_LIBRARIES} -lGL -lGLU)

message(STATUS "${Bullet_DIR}")
message(STATUS "${BULLET_INCLUDE_DIR}")
message(STATUS "${BULLET_LIBRARIES}")

#else(USE_SYSTEM_BULLET)
#   add_subdirectory("${PROJECT_SOURCE_DIR}/lib/bullet" )
#   include_directories("${PROJECT_SOURCE_DIR}/lib/bullet/src")
#endif(USE_SYSTEM_BULLET)

# set cmake compile features and options, this replaces the CMAKE_CXX_FLAGS
# for c++ version: cxx_std_11, cxx_std_14, cxx_std_17
# target_compile_features(${PROJECT_NAME} PRIVATE cxx_std_11)
# target_compile_options(${PROJECT_NAME} PRIVATE -Werror)
# set(CMAKE_VERBOSE_MAKEFILE ON)