contract Test {
    // Test valid Unicode escape sequences in string literals
    receive() {
        let s1: String = "Unicode fixed: \u26A1";   // should be a lightning emoji
        let s2: String = "Unicode variable: \u{1F602}"; // should be the laughing emoji
    }
}
