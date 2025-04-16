fun test_unary_neg(): Int {
    return -42;
}

contract TestUnaryNeg {
    receive() {
        test_unary_neg();
    }
}
