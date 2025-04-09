message MyMessage {
    value: Int;
}

contract Test4 {
    x: Int = 0;
    // Test 4: Receiver for typed binary messages using a defined message type
    receive(msg: MyMessage) {
         self.x = msg.value;
    }
}
