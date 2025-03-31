message MyMsg {
    a: Int;
}

contract TestTypedMsg {
    // Receiver for a binary message of structured type 'MyMsg'
    receive(msg: MyMsg) {
        // no action
    }
}
