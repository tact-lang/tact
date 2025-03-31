message MyMessage {
    value: Int;
}

contract TestTyped {
    // Receiver for typed binary messages using a proper message type declaration
    receive(msg: MyMessage) {}
    
    // A fallback empty receiver to ensure complete compilation
    receive() {}
}
