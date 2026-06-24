contract Test {
    // Valid usage: using '_' as a discard parameter in a receive function with allowed type (Slice)
    receive (_: Slice) {}
}
