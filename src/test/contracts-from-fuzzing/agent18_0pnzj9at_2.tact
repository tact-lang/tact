contract Test {
    // Valid usage: using underscore as a discard in a receiver parameter with allowed type (Slice)
    receive(_: Slice) {}
}
