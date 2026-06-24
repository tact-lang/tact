message MyMsg {
    a: Int;
}

contract TestMsg {
    // Receiver for typed binary message MyMsg
    receive(msg: MyMsg) {
    }
}
