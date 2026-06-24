contract Test {
    // Valid: discard parameter with Slice type
    receive(_: Slice) {}
}
