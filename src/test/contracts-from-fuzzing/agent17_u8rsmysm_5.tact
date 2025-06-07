// Snippet 1: Valid usage - wildcard in receive parameter for discarding a Slice value
contract Test {
    receive(_: Slice) {}
}
