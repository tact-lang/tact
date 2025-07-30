fun testFunc(_: Int): Int {
    return 42;
}

contract Test {
    receive() {
        testFunc(123);
    }
}
