contract Test {
    // Valid usage: '_' as a discarding parameter in the receive function, using an allowed type (Slice)
    receive(_ : Slice) {}
}
