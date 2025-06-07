contract TestEscape {
    receive() {
        // Testing escape sequences in string literal
        // Expected: string literal with newlines, tabs, quotes, and backslashes properly interpreted
        let s: String = "Hello\nWorld\t\"Test\"\\End";
        dump(s.asSlice());
    }
}
