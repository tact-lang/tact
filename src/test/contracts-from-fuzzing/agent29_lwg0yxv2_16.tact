message MyMessage {
    value: Int;
}

contract Test {
    receive(msg: MyMessage) {
        let value = msg.value;
    }

    init() {
        let msg = MyMessage{value: 1};
        send(SendParameters{to: myAddress(), value: 0, mode: 0, body: beginCell().storeInt(msg.value, 32).endCell()});
    }
}