contract Test {
    // Valid usage: using wildcard in receive parameter with allowed type 'Slice'
    // According to the error message, receive can accept a message, Slice or String. Slice appears valid.
    receive(_: Slice) {}
}
