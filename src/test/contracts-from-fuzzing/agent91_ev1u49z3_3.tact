contract TestEscape {
    receive() {
        // Testing escape sequences in string literal
        let s: String = "Line1\nLine2\tTabbed\"Quote\"";
        let _ = s.asSlice();
    }
}
