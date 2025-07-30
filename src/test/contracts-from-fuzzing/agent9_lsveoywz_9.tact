contract TrailingBackslash {
    receive() {
        // This should trigger a compile error due to incomplete escape sequence
        let s: String = "Ends with a backslash \\";
    }
}
