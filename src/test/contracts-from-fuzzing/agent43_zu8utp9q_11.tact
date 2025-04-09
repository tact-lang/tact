message MyMessage {
    value: Int;
}

contract TestTypedCorrect {
    // Test 11: Valid typed binary message receiver using a custom message type declared with 'message'.
    receive(msg: MyMessage) {}
}
