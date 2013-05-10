import unittest
import matrmul
import numpy as np

class TestMatrMul(unittest.TestCase):
    '''
    Tests for the sample matrix multiplication module.

    '''
    def test_vector_multiplication(self):
        a = np.array([[1., 2., 3.]])
        b = a.reshape(3, 1)
        self.assertEqual(np.equal(matrmul.mul(a, b), a.dot(b)).all(), True)

    def test_matrix_squaring(self):
        a = np.array([[1., 2., 3.],
                      [4., 5., 6.],
                      [7., 8., 9.]])
        self.assertEqual(np.equal(matrmul.mul(a, a), a.dot(a)).all(), True)

    def test_matrix_multiplication(self):
        a = np.array([[1., 2., 3., 4.],
                      [4., 3., 2., 1.]])
        b = np.array([[ 1., 0.],
                      [ 2., 3.],
                      [ 4., 4.],
                      [-1., 2.]])
        self.assertEqual(np.equal(matrmul.mul(a, b), a.dot(b)).all(), True)

    def test_identity_multiplication(self):
        eye = np.eye(3)
        a = np.random.random((3, 3)) * 10
        self.assertEqual(np.equal(matrmul.mul(eye, a),
                                  matrmul.mul(a, eye)).all(), True)
        self.assertEqual(np.equal(matrmul.mul(eye, a), eye.dot(a)).all(), True)


if __name__ == '__main__':
    unittest.main()
