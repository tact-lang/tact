fun testAllEscapes(): String {
    // Test all valid escape sequences in a single string
    return "backslash: \\ , double-quote: \" , newline: \n, tab: \t, unicode short: \u1234, unicode long: \u{1F602}";
}

contract TestContract {
    receive() {
        let s: String = testAllEscapes();
    }
}
