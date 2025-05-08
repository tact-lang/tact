fun testReturnNull(): Int? {
    return null;
}

contract TestContract {
    receive() {
        testReturnNull();
    }
}
