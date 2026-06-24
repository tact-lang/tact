contract TestValid1 {
    // Valid use: wildcard in receiver parameter with allowed type Slice
    receive (_: Slice) {}
}
