fun testEscapes(): String {
    return "Line1\nLine2\tTabbed";
}

contract Test {
    receive() {
        testEscapes();
    }
}
