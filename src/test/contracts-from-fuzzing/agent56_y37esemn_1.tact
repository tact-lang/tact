contract TestEscapes {
    receive() {
        // Testing multiple escape sequences in string literal
        let s: String = "Line1\nLine2\tTabbed \\ Backslash \"Quote\" \x21"; // \x21 is '!'
    }
}
