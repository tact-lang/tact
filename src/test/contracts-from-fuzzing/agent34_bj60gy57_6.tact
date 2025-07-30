message MyMsg {
    value: Int;
}

contract Test {
    last: Int = 0;
    
    // Typed binary message receiver using a message type
    receive(msg: MyMsg) {
        self.last = msg.value;
    }
}
