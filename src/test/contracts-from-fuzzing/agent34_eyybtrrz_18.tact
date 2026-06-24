message MyMessage {
    value: Int;
}

contract ContractA {
    receive(slice: Slice) {
        let addr: Address = slice.loadAddress();
        let value: Int = slice.loadInt(32);
        send(SendParameters{to: addr, value: 0, mode: 1, body: MyMessage{value: value + 1}.toCell()});
    }
}

contract ContractB {
    receive(msg: MyMessage) {
        let value = msg.value;
    }
}