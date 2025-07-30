message TestMessage {
    value: Int;
}

contract Sender {
    fun sendMessage(to: Address) {
        let body: Cell = beginCell().storeInt(TestMessage{value: 1}.value, 32).endCell();
        send(SendParameters{to: to, value: 0, bounce: false, mode: 0, body: body});
    }
}

contract Receiver {
    receive(msg: TestMessage) {
        let x = msg.value;
    }
}
