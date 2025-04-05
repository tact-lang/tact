message MyMessage {
    value: Int;
}

contract TestContract {
    receive() {
        let msg = MyMessage{ value: 1 };
        send(SendParameters{
            to: myAddress(),
            value: 1,
            mode: 64,
            body: beginCell().storeInt(msg.value, 32).endCell()
        });
    }
}