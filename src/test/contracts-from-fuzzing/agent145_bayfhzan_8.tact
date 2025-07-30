message MyMsg {
    x: Int;
}

contract Test {
    // Valid typed binary message receiver using a message type
    receive(msg: MyMsg) {
        return;
    }
}
