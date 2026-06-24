contract Test {
    // External receiver: meant for off-chain messages, no sender.
    external("hello external") {
        // External receiver logic
    }
}
