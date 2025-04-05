contract Test {
    receive() {
        let msg = context();
        let value = msg.value;
    }
}