message MyMsg {
    a: Int;
}

contract Test {
    // Specific typed binary message receiver
    receive(msg: MyMsg) {}
    
    // Fallback receiver for unmatched binary messages
    receive(msg: Slice) {}
}