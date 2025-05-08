contract Test {
    receive() {
        // Test empty string literal
        let s: String = "";
        let sl: Slice = s.asSlice();
    }
}
