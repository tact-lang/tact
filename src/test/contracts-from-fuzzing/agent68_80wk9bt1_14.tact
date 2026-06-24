contract Test {
    // External receiver with a specific comment. External messages do not have a sender, so using sender() should cause a compile-time error.
    external("test") {
        let a = sender(); // attempt to use sender() in an external receiver
    }
}
