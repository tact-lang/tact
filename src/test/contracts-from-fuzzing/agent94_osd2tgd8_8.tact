contract TestStringEquality {
    // This contract tests the equality operator on strings.
    receive() {
        // Two string literals with identical content using different escape notations
        let s1: String = "Hello,\nWorld!";
        let s2: String = "Hello,\nWorld!";
        // Check equality
        let eq: Bool = (s1 == s2);
        eq;
    }
}
