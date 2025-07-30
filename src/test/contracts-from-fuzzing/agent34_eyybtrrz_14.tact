message MyMessage {
    value: Int;
}

contract SimpleContract {
    receive(slice: Slice) {
        let addr: Address = slice.loadAddress();
        send(SendParameters{to: addr, value: 0, mode: 1, body: MyMessage{value: 123}.toCell()});
    }
}