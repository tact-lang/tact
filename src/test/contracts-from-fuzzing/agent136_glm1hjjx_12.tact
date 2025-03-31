contract Test {
    // External message receiver: does not have a sender and can be called by anyone off-chain
    external("hello_external") {
        // external message handling
    }
}
