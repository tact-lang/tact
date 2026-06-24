/* Snippet 1: Valid usage of wildcard in receive parameter with allowed type (Slice) */
contract Test {
    receive (_: Slice) {}
}
