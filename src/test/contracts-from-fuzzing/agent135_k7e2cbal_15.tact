contract TestExternal {
    // external receiver for off-chain message with specific comment
    external("hello, it's me") {
        // body can be empty
    }
}
