# use cmake 3 which supports targets
cmake_minimum_required(VERSION 3.1.3)

# project name
project(bullet_simulation_interface)

# default build type
if(NOT CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE Release)
endif()

# build bullet as third party
if(${BUILD_THIRDPARTY})
  message(STATUS "Building bullet3")

  message(STATUS "Set cmake flags")
  unset(CMAKE_ARGS)
  if(DEFINED CMAKE_BUILD_TYPE)
    list(APPEND CMAKE_ARGS "-DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}")
  endif()
  if(DEFINED CMAKE_INSTALL_PREFIX)
    list(APPEND CMAKE_ARGS "-DCMAKE_INSTALL_PREFIX=${CMAKE_INSTALL_PREFIX}")
  endif()

  message(STATUS "Build bullet3 if directory is not present")
  if (NOT EXISTS "${CMAKE_SOURCE_DIR}/thirdparty/bullet3")
    set(SCRIPT "build_bullet.sh")
    execute_process(COMMAND bash ${SCRIPT} ${CMAKE_ARGS} WORKING_DIRECTORY "${CMAKE_SOURCE_DIR}/thirdparty")
  endif()
endif()

