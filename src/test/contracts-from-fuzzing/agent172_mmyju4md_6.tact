message MyMessage {
    value: Int;
}

contract Test {
    // Test 4: Typed binary message receiver using parameter of type MyMessage
    receive(msg: MyMessage) {
        // Use the message field in a dummy computation to ensure it's compiled
        let dummy = msg.value + 1;
    }
}
