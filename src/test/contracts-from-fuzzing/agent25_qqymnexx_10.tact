contract Test {
    receive() {
        // Test string literal with Unicode escape sequences:
        // \u{1F602} represents 😂 and \u263A represents ☺
        let s: String = "Unicode test: \u{1F602} and \u263A";
    }
}
