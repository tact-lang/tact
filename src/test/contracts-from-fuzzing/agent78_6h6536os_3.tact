contract TestEscape {
    // Test valid escape sequences in string literals
    receive() {
        let s: String = "Line1\nLine2\tTabbed\"Quote\"";
    }
}
