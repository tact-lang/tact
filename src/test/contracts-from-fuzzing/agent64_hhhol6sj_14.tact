fun testMultilineLiteral(): String {
    // This string literal contains an actual newline character, which is disallowed.
    return "Hello
World";
}

contract TestContract {
    receive() {
        let s = testMultilineLiteral();
    }
}
