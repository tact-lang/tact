message MyMessage {
    value: Int;
}

contract MyContract {
    receive(msg: MyMessage) {
        let target: Address = myAddress();
        send(SendParameters{to: target, value: 0, mode: 128, body: beginCell().storeInt(msg.value, 32).endCell()});
    }
}
