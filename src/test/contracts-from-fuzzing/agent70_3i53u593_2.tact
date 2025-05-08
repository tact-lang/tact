contract Test {
    // Valid receiver parameter usage with discarding parameter of type Slice
    receive (_: Slice) {}
}
