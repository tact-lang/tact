message MyMsg {
    a: Int;
}

contract Test {
    last: Int = 0;
    
    // Correct typed binary message receiver using message type
    receive(msg: MyMsg) {
        self.last = msg.a;
    }

    // Fallback receiver
    receive() {}
}
