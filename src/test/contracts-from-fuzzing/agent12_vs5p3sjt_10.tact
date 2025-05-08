fun testMultiline(): String {
    return "Line1
Line2";
}

contract TestMultiline {
    receive() {
        testMultiline();
    }
}
