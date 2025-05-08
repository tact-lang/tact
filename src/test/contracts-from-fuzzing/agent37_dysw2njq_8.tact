contract TestContract {
    receive() {
        let senderAddress: Address = sender();
    }
}