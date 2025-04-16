fun testLiteralBool(): Bool {
    return false;
}

contract TestLiteralBool {
    receive() {
        testLiteralBool();
    }
}
