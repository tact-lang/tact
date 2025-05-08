fun testLiteralString(): String {
    return "Hello, Tact!";
}

contract TestLiteralString {
    receive() {
        testLiteralString();
    }
}
