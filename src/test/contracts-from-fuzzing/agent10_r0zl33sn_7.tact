fun test_quote_escape() {
    // Test string literal with escaped double quotes as per documentation
    let s: String = "He said: \"Hello\"";
    dump(s); // expected to dump: He said: "Hello"
}

contract TestContract {
    receive() {
        test_quote_escape();
    }
}
