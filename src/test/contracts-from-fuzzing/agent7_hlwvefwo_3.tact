contract TestContract {
    receive() {
        send(SendParameters{
            to: myAddress(),
            value: 1,
            mode: 64,
            body: "Hello".asComment()
        });
    }
}