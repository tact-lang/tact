message MyMessage {
    value: Int;
}

contract ContractA {
    receive(msg: MyMessage) {
        let value = msg.value;
    }
}

contract ContractB {
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