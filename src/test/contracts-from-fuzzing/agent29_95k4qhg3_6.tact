message MyMsg {
    value: Int;
}

contract Test {
    // Test 4: Receiver for binary message of type MyMsg
    receive(msg: MyMsg) {
        // Use the message parameter to ensure it's utilized
        let x = msg.value;
    }
}
