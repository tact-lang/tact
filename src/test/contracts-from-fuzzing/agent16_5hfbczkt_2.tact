contract Test {
    // Valid usage: using wildcard symbol in a receiver parameter with allowed type Slice
    receive (_: Slice) {}
}
