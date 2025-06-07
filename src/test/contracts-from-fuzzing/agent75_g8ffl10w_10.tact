fun test_mul(): Int {
    return 6 * 7;
}

contract TestMul {
    receive() {
        test_mul();
    }
}
