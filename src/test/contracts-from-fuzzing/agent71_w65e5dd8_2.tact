contract Test {
    // Test 1: Valid use of discard wildcard as receiver parameter
    // Using allowed type Slice as per error message requirements
    receive(_: Slice) {}
}
