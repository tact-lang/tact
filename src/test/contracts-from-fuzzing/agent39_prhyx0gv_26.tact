contract Test {
    // Test: External receiver with no comment parameter; should trigger a compile error because external receivers require a comment literal
    external() {
        // do nothing
    }
}
