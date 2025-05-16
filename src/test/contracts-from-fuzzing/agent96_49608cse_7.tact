contract TestContract {
    receive() {
        // Testing valid \x escape sequence in a string literal. \x41 should be interpreted as 'A'.
        let s: String = "Test: \x41";
        let _slice: Slice = s.asSlice();
    }
}
