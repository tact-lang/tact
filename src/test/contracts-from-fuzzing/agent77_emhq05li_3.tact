// Test 1: Valid usage - wildcard in receive parameter with type Slice
contract Test {
    // Allowed: discard parameter of allowed type Slice
    receive(_: Slice) {}
}
