message MyMsg {
    value: Int;
}

contract TestTyped {
    // Valid receiver for a typed binary message
    receive(msg: MyMsg) {}
}
