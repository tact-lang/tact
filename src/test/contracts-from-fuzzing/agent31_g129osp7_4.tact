fun testReturn(): Int {
    return 42;
}

contract TestContract {
    receive() {
        testReturn();
    }
}
