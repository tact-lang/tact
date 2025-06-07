contract Test {
    // Test external receiver: external messages receiver for literal comment
    external("hello") {
        // External receiver that accepts a text comment
    }
}
