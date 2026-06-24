contract TestEmptyString {
    receive() {
        // Test with empty string literal
        let s: String = "";
        dump(s.asSlice());
    }
}
