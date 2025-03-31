contract Test {
    // Valid usage: wildcard parameter in receive using allowed type Slice
    receive(_: Slice) {}
}
