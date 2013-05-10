NumPy ndarray ⇋ OpenCV Mat conversion, that just works.
===========================================================

API
-----

- `class NDArrayConverter`: The converter class
        
- `NDArrayConverter::NDArrayConverter()`: Constructor

- `cv::Mat NDArrayConverter::toMat(const PyObject* o)`: Convert a NumPy ndarray 
  to a `cv::Mat`. 

    - o is the object representing the Python representation of the ndarray.

    - **Returns** a `cv::Mat` which is the OpenCV representation of o.

- `PyObject* NDArrayConverter::toNDArray(const cv::Mat& mat)`: Convert a `cv::Mat` to a NumPy ndarray.
    
    - mat is the cv::Mat to convert.

    - **Returns** a `PyObject*` that is the Python representation of an ndarray.


Example
--------

`matrmul.cpp` contains an implementation of matrix multiplication that is
callable from Python. It takes two `ndarrays`, converts both to `cv::Mat` using
`NDArrayConverter`, multiplies these two `Mat`s using `cv::Mat::operator*`,
converts the result of multiplication back to an `ndarray` and returns this
result to Python. The plumbing(passing of values to and from Python) 
is handled by Boost::Python.


Building and testing
---------------------

After installing [Boost::Python][1] and [NumPy][2](maybe the devel package),
    
    $ make
    $ make test

This will build an object file usable in other projects, `conversion.o` and
run tests from `test.py`, which actually uses the compiled `matrmul.so` Python
module to test matrix multiplication.

[1]: http://www.boost.org/doc/libs/1_53_0/libs/python/doc/index.html
[2]: http://www.numpy.org/
