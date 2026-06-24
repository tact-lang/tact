// Snippet 1: Valid discard usage in a single receiver parameter
contract Test1 {
    // Using allowed type Slice for receiver parameter
    receive(_: Slice) {}
}
