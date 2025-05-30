contract TestBackspace {
    receive() {
        // Testing backspace escape sequence in string literal
        let s: String = "Hello\bWorld";
        let _ = s.asSlice();
    }
}
