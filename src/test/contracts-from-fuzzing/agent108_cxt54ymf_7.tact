message MyMsg {
    a: Int;
}

contract TestTypedMsg {
    receive(msg: MyMsg) {}
}
