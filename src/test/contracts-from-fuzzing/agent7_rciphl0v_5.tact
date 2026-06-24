fun testReturnNegative(): Int {
    return -5;
}

contract TestContract {
    receive() {
        testReturnNegative();
    }
}