message MyMsg {
    x: Int;
}

contract Test {
    // Receiver for typed binary message using a declared message type
    receive(msg: MyMsg) {
        // action for typed binary message
    }
}
