contract Test {
    receive() {
        send(SendParameters{
            to: myAddress(),
            value: 0,
            mode: 1,
            body: null
        });
    }
}