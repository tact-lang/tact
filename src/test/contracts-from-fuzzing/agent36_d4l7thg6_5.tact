message MyMsg {
    a: Int;
}

contract TestTyped {
    received: Int = 0;

    receive(msg: MyMsg) {
        self.received = msg.a;
    }
}
