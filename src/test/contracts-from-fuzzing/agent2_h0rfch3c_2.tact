contract Test {
    // Valid usage: discard wildcard in receive parameter with type Slice
    receive(_: Slice) {}
}
