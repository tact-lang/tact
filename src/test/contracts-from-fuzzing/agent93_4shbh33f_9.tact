contract TestEmptyString {
    receive() {
        // Test usage of an empty string literal
        let s: String = ""; // empty string literal
        let sl: Slice = s.asSlice();
    }
}
