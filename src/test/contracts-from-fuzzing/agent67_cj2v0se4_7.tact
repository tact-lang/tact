contract Test {
    // Using underscore to discard the Slice parameter in fallback receiver
    receive(_: Slice) {
        // processing fallback binary message
    }
}
