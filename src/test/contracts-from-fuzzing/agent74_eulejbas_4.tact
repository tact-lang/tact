fun testUnaryNeg(): Int {
    return -5;
}

contract TestUnaryNeg {
    receive() {
        testUnaryNeg();
    }
}
