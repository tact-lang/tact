contract Test {
    // Valid: using wildcard in receive parameter with allowed type Slice
    receive (_: Slice) {
    }
}
