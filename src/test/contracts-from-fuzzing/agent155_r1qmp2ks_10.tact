message MyMessage {
    value: Int;
}

contract TestTypedMessage {
    var: Int = 0;
    receive(msg: MyMessage) {
        self.var = msg.value;
    }
}
