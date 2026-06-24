contract Test {
    // External message receiver: accessible off-chain with a specific text message
    external("hello, it's me") {
        // External receiver logic
    }
}
