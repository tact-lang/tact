contract TestContract {
    receive() {
        let msg = context();
        let value = msg.value;
    }
}