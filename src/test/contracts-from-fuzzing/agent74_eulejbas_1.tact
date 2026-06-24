fun testLiteralInt(): Int {
    return 42;
}

contract TestLiteralInt {
    receive() {
        testLiteralInt();
    }
}
