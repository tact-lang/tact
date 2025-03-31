contract Test {
    // Valid use of '_' in a receive parameter: discarding the input, expected to compile successfully
    receive(_: Slice) {}
}
