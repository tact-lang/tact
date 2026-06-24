contract Test {
    // Valid usage: _ as a discard parameter in a receive function with allowed type (Slice)
    receive(_: Slice) {}
}
