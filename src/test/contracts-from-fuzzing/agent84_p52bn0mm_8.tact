contract TestContract {
    receive() {
        // Test 5: String literal with multiple escape sequences
        // Includes Unicode escape, newline, tab, backslash, and quote
        let a: String = "\u{1F602}\nTest \t Escape with \\ and \" quotes";
        dump(a);
    }
}
