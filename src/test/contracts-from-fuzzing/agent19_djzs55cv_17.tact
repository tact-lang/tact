message InternalMessage {
    value: Int;
}

contract TestContract {
    receive() {
        let msg = beginCell().storeInt(10, 32).endCell();
        send(SendParameters{
            to: myAddress(),
            value: 0,
            mode: 1,
            body: msg
        });
    }
}