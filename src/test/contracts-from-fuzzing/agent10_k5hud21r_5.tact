message TestMessage {
    a: Int;
}

contract Test {
    init() {
        let builder = beginCell();
        builder.storeInt(1, 32); // Store 'a' value
        send(SendParameters{
            to: myAddress(),
            value: 0,
            mode: 64,
            body: builder.endCell()
        });
    }

    receive() {
    }
}