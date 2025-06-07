contract Test {
    // Valid usage: discard parameter in receive function with allowed type (Slice)
    receive(_: Slice) {}
}
