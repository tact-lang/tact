contract Test {
    receive() {
        // Test escape sequences in string literal
        let s: String = "Line1\nLine2\tTabbed";
    }
}
