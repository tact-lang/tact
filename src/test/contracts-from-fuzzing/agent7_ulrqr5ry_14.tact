contract TestTrailingBackslash {
    receive() {
        // Test: A string literal that ends with an escaped backslash
        // Here, "\\" in the literal produces a single backslash at the end.
        let s: String = "Ends with backslash \\";
        let s2: String = s.asSlice().asString();
    }
}
