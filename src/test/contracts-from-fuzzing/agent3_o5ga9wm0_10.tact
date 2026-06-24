contract Test {
    // Test compile-time function ascii() on a string literal in a persistent field
    a: Int = ascii("Tact");

    receive() {
        // Use string conversion functions
        let s: String = "Test string";
        let sl: Slice = s.asSlice();
        let s2: String = sl.asString();

        // Use a valid unicode escape sequence
        let s3: String = "Smile: \u{1F600}";
    }
}
