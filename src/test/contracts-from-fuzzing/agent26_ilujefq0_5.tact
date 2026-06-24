fun testBoolOp(): Bool {
    return true && false || false;
}

contract BoolOpTest {
    receive() {
        testBoolOp();
    }
}
