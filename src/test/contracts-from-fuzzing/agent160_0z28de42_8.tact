message MyMessage {
    x: Int;
}

contract Test {
    // Test case 4A: Correctly typed binary message receiver using a message type
    receive(msg: MyMessage) {
        // For messages matching MyMessage type, do nothing
    }
}
