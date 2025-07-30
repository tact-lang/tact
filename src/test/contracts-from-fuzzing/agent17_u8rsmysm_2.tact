contract Test {
    // Valid usage: wildcard in receive parameter for discarding a Slice value
    receive(_: Slice) {}
}
