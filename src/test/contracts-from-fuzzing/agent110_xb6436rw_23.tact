message MyMsg {
    value: Int;
}

contract TestFullReceiver {
    state: Int = 0;
    
    // 1. Empty internal receiver (empty message)
    receive() {
         self.state = 1;
    }
    
    // 2. Specific text receiver
    receive("text") {
         self.state = 2;
    }
    
    // 3. Arbitrary text receiver
    receive(msg: String) {
         self.state = 3;
    }
    
    // 4. Typed binary receiver
    receive(msg: MyMsg) {
         self.state = msg.value;
    }
    
    // 5. Fallback binary receiver for unmatched messages
    receive(msg: Slice) {
         self.state = 99;
    }
    
    // 6. External receiver: for off-chain invocations
    external("ext") {
         self.state = 100;
    }
    
    // 7. Bounced receiver
    bounced(msg: Slice) {
         self.state = -1;
    }
}
