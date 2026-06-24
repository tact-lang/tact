contract Test {
    // Test 32: External receiver declared with a parameter type (should produce a syntax error)
    external(msg: String) {
        // This should be rejected because external receivers must use a literal text comment
    }

    receive() {
        // Empty receiver as fallback
    }
}
