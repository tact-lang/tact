message MyMsg {
    a: Int;
}

contract TestTyped {
    // Receiver for a typed binary message using a proper message type declaration
    receive(msg: MyMsg) {
        // process typed message
    }
}
