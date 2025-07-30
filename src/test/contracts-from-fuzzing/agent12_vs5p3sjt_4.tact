fun testQuote(): String {
    return "He said, \"Hello\"";
}

contract TestEscapedQuote {
    receive() {
        testQuote();
    }
}
