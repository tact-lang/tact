message MyMessage {
    x: Int;
}

contract Test {
    // Receiver with underscore parameter for typed binary message
    receive(_: MyMessage) {
        // Process MyMessage with underscore discarding parameter name
    }
}
