message MyMessage {
    value: Int;
}

contract Test {
    // Test 4: Typed binary message receiver. Matches messages of type MyMessage and extracts its value.
    receive(msg: MyMessage) {
        let x: Int = msg.value;
    }
}
