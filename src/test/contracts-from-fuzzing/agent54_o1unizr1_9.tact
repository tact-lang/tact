contract Test {
    // Test using empty string literal
    receive() {
        let s: String = "";
        dump(s.asSlice());
    }
}
