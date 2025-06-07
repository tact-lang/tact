message TestMessage {
    value: Int;
}

message AnotherMessage {
    flag: Bool;
}

contract Sender {
    fun sendMessage(to: Address) {
        let body: Cell = beginCell().storeBit(true).endCell();
        send(SendParameters{to: to, value: 0, bounce: false, mode: 0, body: body});
    }
}

contract Receiver {
    receive(msg: TestMessage) {
        let x = msg.value;
    }
}
