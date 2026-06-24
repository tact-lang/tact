// Test A1: Valid usage - wildcard as a receive parameter (Slice type)
contract Test {
    receive (_: Slice) {
        // valid usage: discard parameter
    }
}
