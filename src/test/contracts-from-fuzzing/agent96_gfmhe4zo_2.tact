// Test A1: Valid usage of wildcard in receive function parameter with allowed type (Slice)
contract TestA1 {
    receive (_: Slice) {}
}
