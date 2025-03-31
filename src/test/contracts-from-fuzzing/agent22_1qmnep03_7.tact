// Variant 1: Valid usage - wildcard in receive parameter with allowed type (Slice)
contract Test {
    receive(_: Slice) {}
}
