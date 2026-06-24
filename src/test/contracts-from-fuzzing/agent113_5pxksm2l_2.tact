contract TestA1 {
    // Valid usage: underscore as a parameter in a receive function with allowed type Slice
    receive(_: Slice) {}
}
