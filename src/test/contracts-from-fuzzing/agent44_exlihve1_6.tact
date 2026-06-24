message MyMsg {
    x: Int;
}

contract TestTypedMsg {
    result: Int = 0;
    
    // Receiver for typed binary message using defined message MyMsg
    receive(msg: MyMsg) {
        self.result = msg.x;
    }
}
