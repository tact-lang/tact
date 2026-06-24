contract TestA {
    // Valid: Discard parameter in receive function with allowed type Slice
    receive(_ : Slice) {}
}
