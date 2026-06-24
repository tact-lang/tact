message MyMsg {
    x: Int;
}

contract Test {
    // Receiver for typed binary messages
    receive(msg: MyMsg) {}
    
    // Dummy receiver to ensure contract compilation
    receive() {}
}
