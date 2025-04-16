fun testMaxValidUnicode(): String {
    return "Max valid: \u{10FFFF}";
}

contract Test {
    receive() {
        testMaxValidUnicode();
    }
}
