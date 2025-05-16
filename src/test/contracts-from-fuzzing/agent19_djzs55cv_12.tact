message InternalMessage {
    value1: Int;
    value2: Bool;
}

contract TestContract {
    receive() {
        let msg = beginCell().storeInt(10, 32).storeBit(true).endCell();
        send(SendParameters{
            to: myAddress(),
            value: 0,
            mode: 1,
            body: msg
        });
    }
}