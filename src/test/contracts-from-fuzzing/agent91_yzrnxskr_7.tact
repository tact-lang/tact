contract Test {
    // Test case: using underscore to discard unused parameter in a text receiver
    receive(_: String) {
        // logic: simply do nothing
    }
}
