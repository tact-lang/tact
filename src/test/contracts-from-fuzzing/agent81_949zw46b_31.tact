contract Test {
    // Test 31: External receiver function - for off-chain messages
    // External receivers do not have a sender, and are invoked by any external caller
    external("hello, it's me") {
        // external message logic
    }

    receive() {
        // fallback empty receiver
    }
}
