contract Test {
    // Valid usage: discard parameter in receive using allowed type Slice
    receive(_: Slice) {}
}
