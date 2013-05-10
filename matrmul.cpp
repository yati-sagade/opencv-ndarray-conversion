#include <iostream>
#include <opencv2/imgproc/imgproc.hpp>
#include <boost/python.hpp>
#include "conversion.h"

namespace py = boost::python;

static void
print_matrix(const cv::Mat& matrix)
{
  for (int i(0); i < matrix.rows; i++)
  {
    const double *ptr = matrix.ptr<double>(i);
    for (int j(0); j < matrix.cols; j++)
    {
      std::cout << "\t" << ptr[j];
    }
    std::cout << std::endl;
  }
}

PyObject*
mul(PyObject *left, PyObject *right)
{
    NDArrayConverter cvt;
    cv::Mat leftMat, rightMat;
    leftMat = cvt.toMat(left);
    rightMat = cvt.toMat(right);
    auto r1 = leftMat.rows, c1 = leftMat.cols, r2 = rightMat.rows,
         c2 = rightMat.cols;
    // Work only with 2-D matrices that can be legally multiplied.
    if (c1 != r2)
    {
        PyErr_SetString(PyExc_TypeError, 
                        "Incompatible sizes for matrix multiplication.");
        py::throw_error_already_set();
    }
    cv::Mat result = leftMat * rightMat;

    PyObject* ret = cvt.toNDArray(result);

    return ret;
}

static void init()
{
    Py_Initialize();
    import_array();
}

BOOST_PYTHON_MODULE(matrmul)
{
    init();
    py::def("mul", mul);
}
