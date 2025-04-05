contract TestContract {
    receive() {
        let msg = context();
        let senderAddress: Address = msg.sender;
    }
}