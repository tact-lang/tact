contract Test {
    // Testing usage of underscore to discard receiver parameter for binary messages
    receive(_: Slice) {}
}
