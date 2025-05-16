// Snippet A: Valid usage of wildcard _ in a receive parameter (allowed only as discard)
contract TestA {
    // allowed: discard parameter as a Slice
    receive(_: Slice) {}
}
