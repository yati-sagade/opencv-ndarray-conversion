PYTHON_VERSION = 2.7
PYTHON_INCLUDE = /usr/include/python$(PYTHON_VERSION)

BOOST_INC = /usr/local/include
BOOST_LIB = /usr/local/lib
OPENCV_LIB = $$(pkg-config --libs opencv)
OPENCV_INC = $$(pkg-config --cflags opencv)

TARGET = matrmul

$(TARGET).so: $(TARGET).o conversion.o
		g++ -shared -Wl,--export-dynamic \
		$(TARGET).o conversion.o -L$(BOOST_LIB) -lboost_python -lboost_numpy \
		$(OPENCV_LIB) \
		-L/usr/lib/python$(PYTHON_VERSION)/config -lpython$(PYTHON_VERSION) \
		-o $(TARGET).so

$(TARGET).o: $(TARGET).cpp
		g++ -std=c++11 -I$(PYTHON_INCLUDE) $(OPENCV_INC) -I$(BOOST_INC) -fPIC -c \
		$(TARGET).cpp

conversion.o: conversion.cpp conversion.h
		g++ -std=c++11 -I$(PYTHON_INCLUDE) $(OPENCV_INC) -I$(BOOST_INC) -fPIC -c \
		conversion.cpp

clean:
	rm -f $(TARGET).so $(TARGET).o conversion.o

test:
	python -m test

	
