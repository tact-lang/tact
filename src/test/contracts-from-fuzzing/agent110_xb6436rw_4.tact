message MyMsg { 
    value: Int; 
}

contract TestTyped {
    state: Int = 0;
    
    receive(msg: MyMsg) {
         // The receiver extracts the value from the binary message type.
         self.state = msg.value;
    }
}