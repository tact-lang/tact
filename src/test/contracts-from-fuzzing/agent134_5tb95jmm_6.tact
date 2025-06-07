message MyMsg { 
    x: Int; 
}

contract Test4 {
    last: Int = 0;
    
    // Typed binary message receiver for MyMsg messages
    receive(msg: MyMsg) {
        self.last = msg.x;
    }
}
