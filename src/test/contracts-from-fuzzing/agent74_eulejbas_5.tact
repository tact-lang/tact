fun testBinaryAdd(): Int {
    return 10 + 20;
}

contract TestBinaryAdd {
    receive() {
        testBinaryAdd();
    }
}
