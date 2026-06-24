contract Test {
    // Valid usage: using _ as discard parameter in receive with allowed type Slice
    receive(_: Slice) {}
}
