message MyMsg {
    value: Int;
}

contract TestInvalidExternalReceiverType {
    // External receivers should only accept string literal parameters for off-chain messages
    // Using a message type here should trigger a compilation error
    external(msg: MyMsg) {
        // This should not compile
    }
}
