contract Test {
    // Test 1: Valid usage: discard receive parameter with an allowed type (String)
    receive(_: String) {}
}
