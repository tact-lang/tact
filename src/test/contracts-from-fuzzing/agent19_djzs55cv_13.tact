message InternalMessage {
    value1: Int;
    value2: Bool;
}

contract TestContract {
    receive(msg: InternalMessage) {
        let msgCell = beginCell().storeInt(msg.value1, 32).storeBit(msg.value2).endCell();
        send(SendParameters{
            to: myAddress(),
            value: 0,
            mode: 1,
            body: msgCell
        });
    }
}