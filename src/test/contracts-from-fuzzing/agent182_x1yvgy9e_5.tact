message MyMsg {
    a: Int;
}

contract Test {
    // Test typed binary message receiver with message type
    receive(msg: MyMsg) { 
        // handling typed binary message
    }

    // Fallback receiver to ensure contract compiles
    receive() { }
}
