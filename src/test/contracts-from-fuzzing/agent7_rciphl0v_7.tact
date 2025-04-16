fun testOptional(): Int? {
    return null;
}

contract TestContract {
    receive() {
        testOptional();
    }
}