fun testBool(): Bool {
    return false;
}

contract Test2 {
    receive() {
        testBool();
    }
}
