contract Test {
    // Test using underscore parameter in fallback receiver by directly discarding the parameter
    receive(_: Slice) {}
}