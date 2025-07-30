contract TestEmpty {
    receive() {
        // Testing empty string literal
        let s: String = "";
        let _ = s.asSlice();
    }
}
