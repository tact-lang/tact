contract Test {
    // Test 1: Valid usage: wildcard as parameter with allowed type Slice
    receive (_: Slice) {}
}
