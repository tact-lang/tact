contract TestContract {
    receive() {
        let msg = context();
        let sender = msg.sender;
    }
}