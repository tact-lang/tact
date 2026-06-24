contract Test {
    receive() {
        // Test string literal with valid escape sequences: \x, \u, and \u{}
        let s: String = "Hex A: \x41, Unicode A: \u0041, Unicode bracket A: \u{41}";
        let _ = s;
    }
}
