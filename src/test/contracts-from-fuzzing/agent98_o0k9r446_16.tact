contract Test {
    // Two specific text comment receivers with different string literals should compile
    receive("foo") { /* handles message with exact comment "foo" */ }
    receive("bar") { /* handles message with exact comment "bar" */ }
}
