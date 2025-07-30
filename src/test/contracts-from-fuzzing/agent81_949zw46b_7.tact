contract Test {
    // Test 7: Using underscore to discard receiver parameter (arbitrary text receiver)
    receive(_: String) {
        // receiver that discards the incoming string parameter
    }
}
