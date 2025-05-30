contract Test {
    // Valid usage: Using wildcard as a parameter in receive function with capitalized type 'Slice'
    receive (_: Slice) {}
}
