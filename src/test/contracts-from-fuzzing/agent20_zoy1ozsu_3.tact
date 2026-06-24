contract Test {
    receive() {
        // Test valid escape sequences: newline and tab
        let s: String = "Line1\nLine2\tTabbed";
    }
}
