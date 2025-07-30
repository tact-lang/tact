message MyMsg {
    a: Int;
}

contract MixedReceivers {
    var: Int = 0;
    
    // Fallback receiver
    receive(msg: Slice) {
        self.var = 100;
    }
    
    // Specific text receiver
    receive("hello") {
        self.var = 200;
    }
    
    // Empty message receiver
    receive() {
        self.var = 300;
    }
    
    // Arbitrary text receiver
    receive(str: String) {
        self.var = 400;
    }
    
    // Typed binary message receiver
    receive(msg: MyMsg) {
        self.var = msg.a;
    }
}
