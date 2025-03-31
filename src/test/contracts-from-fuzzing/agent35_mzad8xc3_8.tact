contract Test {
    receive() {
        // Test escape sequence for double quotes inside a string literal
        let s: String = "This is a \"quoted\" string";
        dump(s);
    }
}
