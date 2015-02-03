project (opencv-ndarray-conversion)
cmake_minimum_required (VERSION 2.6.0)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -g -Wall -std=c++11")

# Find necessary packages
find_package( PythonLibs 2.7 REQUIRED )
include_directories( ${PYTHON_INCLUDE_DIRS} )

find_package( Boost COMPONENTS python REQUIRED )
include_directories( ${Boost_INCLUDE_DIR} )

find_package( OpenCV REQUIRED )
include_directories( ${OpenCV_INCLUDE_DIR} )

# Build our library
add_library(conversion SHARED conversion.cpp )
target_link_libraries(conversion ${Boost_LIBRARIES} ${PYTHON_LIBRARIES} ${OpenCV_LIBRARIES})

# Define the wrapper library that wraps our library
add_library(examples SHARED examples.cpp )
target_link_libraries(examples ${Boost_LIBRARIES} ${PYTHON_LIBRARIES} ${OpenCV_LIBRARIES} examples conversion)
# don't prepend wrapper library name with lib
set_target_properties(examples PROPERTIES PREFIX "" )

