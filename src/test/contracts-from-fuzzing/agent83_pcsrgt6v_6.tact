message MyMsg {
    a: Int;
}

contract Test {
    receive(msg: MyMsg) {
        // typed binary message receiver
    }
}
