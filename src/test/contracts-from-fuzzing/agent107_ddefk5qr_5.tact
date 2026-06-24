message MyMsg {
    flag: Bool;
}

contract Test {
    // Typed binary message receiver
    receive(msg: MyMsg) {}
}
