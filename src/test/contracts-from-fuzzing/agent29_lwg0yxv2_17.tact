message MyMessage {
    value1: Int;
    value2: Bool;
}

contract Test {
    receive(msg: MyMessage) {
        let v1 = msg.value1;
        let v2 = msg.value2;
    }

    init() {
        let msg = MyMessage{value1: 1, value2: true};
        send(SendParameters{to: myAddress(), value: 0, mode: 0, body: beginCell().storeInt(msg.value1, 32).storeBit(msg.value2).endCell()});
    }
}