contract Test {
    receive() {
        // Test: Valid hexadecimal escape sequence \x41, which should yield 'A'
        let s: String = "Valid hex: \x41";
        dump(s);
    }
}
