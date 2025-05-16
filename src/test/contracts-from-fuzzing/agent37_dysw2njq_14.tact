contract TestContract {
    receive() {
        let senderAddress: Address = sender();
        send(SendParameters{to: senderAddress, value: 1, mode: 161, body: null});
    }
}