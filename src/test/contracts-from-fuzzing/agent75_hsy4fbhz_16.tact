contract Test {
    receive() {
        // Test maximum allowed Unicode code point using Unicode escape \u{10ffff}
        let maxUnicode: String = "Max Unicode: \u{10ffff}";
    }
}
