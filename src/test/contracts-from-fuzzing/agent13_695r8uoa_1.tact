fun testReturnLiteral(): Int {
    return 42;
}

contract TestContract {
    receive() {
        testReturnLiteral();
    }
}
