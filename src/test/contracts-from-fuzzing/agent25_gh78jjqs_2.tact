contract Test {
    receive() {
        let msg = context();
        let sender = msg.sender;
    }
}