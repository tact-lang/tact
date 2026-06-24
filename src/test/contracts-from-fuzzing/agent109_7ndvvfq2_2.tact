contract Test1 {
    // Valid usage: wildcard parameter in receive function with allowed type Slice
    receive(_: Slice) {}
}
