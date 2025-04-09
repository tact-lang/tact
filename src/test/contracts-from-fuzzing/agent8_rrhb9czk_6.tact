message TestMessage {
    value: Int;
}

contract TestContract {
    receive() {
        let builder = beginCell();
        builder.storeInt(TestMessage{value: 1}.value, 32);
        let cell = builder.endCell();
        send(SendParameters{to: myAddress(), value: 0, mode: 0, body: cell});
    }
}
