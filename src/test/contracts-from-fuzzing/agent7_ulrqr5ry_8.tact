contract TestValidEscapes {
    receive() {
        // Test valid escape sequences in string literal
        let s: String = "Line1\nLine2\tTabbed\\Backslash\"Quote\"";
    }
}
