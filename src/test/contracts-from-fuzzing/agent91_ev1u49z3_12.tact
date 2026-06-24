contract TestXEscape {
    receive() {
        // Testing \x escape sequence in string literal
        // Expected to emit string: "Value: A"
        let s: String = "Value: \x41";
        let _ = s.asSlice();
    }
}
