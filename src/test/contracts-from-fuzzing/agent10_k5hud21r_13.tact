contract Test {
    init() {
        let builder = beginCell();
        builder.storeInt(1, 32);
        send(SendParameters{
            to: myAddress(),
            value: 0,
            mode: 64,
            body: builder.endCell()
        });
    }

    receive(msg: Slice) {
        let a = msg.loadInt(32);
    }
}