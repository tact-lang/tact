fun testRet(): Int {
    return 42;
}

contract TestReturn {
    receive() {
        dump(testRet());
    }
}
